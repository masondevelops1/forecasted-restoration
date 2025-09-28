local Light, super = Class(Event)

function Light:init(data)
    super.init(self, data)

    self.radius = data.properties["radius"] or 80
    self.color = Utils.parseColorProperty(data.properties["color"] or "#ffffffff")
    if data.properties["alpha"] then
        color[4] = data.properties["alpha"]
    end
    self.offset = {data.properties["offset_x"] or 0, data.properties["offset_y"] or 0}

    self.target_objs = Utils.parsePropertyList("target", data.properties)
end

function Light:postLoad()
    for _,obj in ipairs(self.target_objs) do
        local target = self.world.map:getEvent(obj.id)
        if target then
            local light = LightSource(target.width/2 + self.offset[1], target.height/2 + self.offset[2], self.radius)
            light.color = self.color
            target:addChild(light)
        end
    end
end

return Light