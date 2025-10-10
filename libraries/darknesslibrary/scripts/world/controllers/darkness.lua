local Darkness, super = Class(Event)

function Darkness:init(data)
    super.init(self, data)
    self.darkness = DarknessOverlay(data.properties["alpha"] or 1)
    if data.properties["color"] then
        self.darkness:setColor(Utils.parseColorProperty(data.properties["color"]))
    end
end

function Darkness:onAdd(parent)
    super.onAdd(self, parent)
    self.world:spawnObject(self.darkness, "below_ui")
end

function Darkness:onRemove()
    self.darkness:remove()
end

function Darkness:postLoad()
    if self.data.properties["alpha"] then
        self.darkness.alpha = self.data.properties["alpha"]
    end
    local characters = {}
    if self.data.properties["characters"] then
        if self.data.properties["characters"] == "all" then
            characters = Game.stage:getObjects(Character)
        elseif self.data.properties["characters"] == "party" then
            characters = Utils.mergeMultiple({Game.world.player}, Game.stage:getObjects(Follower))
        elseif self.data.properties["characters"] == "player" then
            characters = {Game.world.player}
        else
            for _,chara in ipairs(Game.stage:getObjects(Character)) do
                if self.data.properties["characters"]:find(chara.actor.id) then
                    table.insert(characters, chara)
                end
            end
        end
    end

    local radius = self.data.properties["light_radius"] or 80
    local color = Utils.parseColorProperty(self.data.properties["light_color"] or "#ffffffff")
    if self.data.properties["light_alpha"] then
        color[4] = self.data.properties["light_alpha"]
    end
    for _,chara in ipairs(characters) do
        local light = LightSource(chara.width/2, chara.height/2, radius)
        light.color = color
        chara:addChild(light)
    end
end

return Darkness