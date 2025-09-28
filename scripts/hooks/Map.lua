---@class Map : Map
local Map, super = Utils.hookScript(Map)

-- TODO: Delete this particular hook when KristalTeam/Kristal#359 is merged
function Map:loadMapData(data)
    local object_depths = {}
    local tile_depths = {}
    local indexed_layers = {}
    local has_battle_border = false

    local layers = {}

    local function loadLayer(layer)
        if layer.type ~= "group" then
            table.insert(layers, layer)
        else
            for i,sublayer in ipairs(layer.layers) do
                local sublayer_copy = Utils.copy(sublayer)
                sublayer_copy.properties = Utils.mergeMultiple(layer.properties, sublayer_copy.properties)
                if i == #layer.layers then
                    sublayer_copy.properties.thin = sublayer.properties.thin
                end
                sublayer_copy.offsetx = (sublayer.offsetx or 0) + (layer.offsetx or 0)
                sublayer_copy.offsety = (sublayer.offsety or 0) + (layer.offsety or 0)
                sublayer_copy.parallaxx = (sublayer.parallaxx or 1) * (layer.parallaxx or 1)
                sublayer_copy.parallaxy = (sublayer.parallaxy or 1) * (layer.parallaxy or 1)
                loadLayer(sublayer_copy)
            end
        end
    end

    for _,layer in ipairs(data.layers or {}) do
        loadLayer(Utils.copy(layer))
    end

    for i,layer in ipairs(layers) do
        self.layers[layer.name] = self.next_layer
        indexed_layers[i] = self.next_layer
        if not (layer.properties and layer.properties.thin) then
            self.next_layer = self.next_layer + self.depth_per_layer
        end
    end

    self.object_layer = nil
    for i,layer in ipairs(layers) do
        local name = layer.name:lower()
        local depth = indexed_layers[i]
        if not has_battle_border and Utils.startsWith(name, "battleborder") then
            self.battle_fader_layer = depth - (self.depth_per_layer/2)
            has_battle_border = true
        end
        if layer.type == "objectgroup" and Utils.startsWith(name, "objects") then
            table.insert(object_depths, depth)
            if layer.properties["spawn"] then
                self.object_layer = depth
            end
        end
        if layer.type == "tilelayer" and not Utils.startsWith(name, "battleborder") then
            table.insert(tile_depths, depth)
        end
        if not Kristal.callEvent(KRISTAL_EVENT.loadLayer, self, layer, depth) then
            self:loadLayer(layer, depth)
        end
    end

    -- old behavior, ideally should not be used
    if not self.object_layer then
        self.object_layer = 1
        local priority_object_layer = nil
        local has_markers_layer = false
        for i,layer in ipairs(layers) do
            local name = layer.name:lower()
            local depth = indexed_layers[i]
            if layer.type == "objectgroup" then
                if Utils.startsWith(name, "markers") then
                    has_markers_layer = true
                    priority_object_layer = nil
                    if #object_depths == 0 then
                        -- If there are no object layers, set the object depth to the marker layer's depth
                        self.object_layer = depth
                    else
                        -- Otherwise, set the object depth to the closest object layer's depth
                        local closest
                        for _,obj_depth in ipairs(object_depths) do
                            if not closest then
                                closest = obj_depth
                            elseif math.abs(depth - obj_depth) <= math.abs(depth - closest) then
                                closest = obj_depth
                            else
                                break
                            end
                        end
                        self.object_layer = closest or depth
                    end
                elseif name == "objects_party" then
                    priority_object_layer = depth
                    break -- always use 'objects_party' if available
                elseif not has_markers_layer then
                    -- If there is no markers layer, set the object layer to the highest object layer
                    if name == "objects" then
                        priority_object_layer = depth
                    end
                    self.object_layer = depth
                end
            end
        end
        -- If no marker layers, prioritize object layers without a custom name
        if priority_object_layer then
            self.object_layer = priority_object_layer
        end
    end

    -- Set the tile layer depth to the closest tile layer below the object layer
    self.tile_layer = 0
    for _,depth in ipairs(tile_depths) do
        if depth >= self.object_layer then break end

        self.tile_layer = depth
    end

    -- If no battleborder layer, set the battle fader layer depth to be below the object layer
    if not has_battle_border then
        self.battle_fader_layer = self.object_layer - (self.depth_per_layer/2)
    end
end

return Map