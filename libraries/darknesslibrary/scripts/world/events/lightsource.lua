local Light, super = Class(Event)

function Light:init(data)
    super.init(self, data.x, data.y, data.width, data.height)
    local color = Utils.parseColorProperty(data.properties["color"] or "#ffffffff")
    if data.properties["alpha"] then
        color[4] = data.properties["alpha"]
    end

    local light
    if data.shape == "point" then
        light = LightSource(0, 0, data.properties["radius"] or 40)
    elseif data.shape == "ellipse" then
        light = LightSource(data.width/2, data.height/2, data.width/2)
    elseif data.shape == "rectangle" then
        light = RectangleLightSource(0, 0, data.width, data.height)
    end
    if light then
        light.color = color
        if data.properties["style"] then
            light.style = data.properties["style"]
        end
        if light.style == "soft" and data.properties["extend"] then
            light.extend = data.properties["extend"]
        end
        self:addChild(light)
    end
end

return Light