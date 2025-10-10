---@class CoolLights: LightSource
local CoolLights, super = Class("LightSource")

---@param data table
function CoolLights:init(data)
    super.init(self, data.x, data.y)
    self.time = 0
    self.light_colors = {
        COLORS.red,
        COLORS.yellow,
        COLORS.blue,
        COLORS.lime,
        COLORS.yellow,
        COLORS.fuchsia,
        ["center"] = COLORS.white,
    }
end

function CoolLights:update()
    self.time = self.time + DT
end

function CoolLights:draw()
    love.graphics.scale(1, .5)
    if self.light_colors["center"] then
        Draw.setColor(self.light_colors["center"])
        love.graphics.circle("fill",0,0,60)
    end
    for i = 1, #self.light_colors do
        -- TODO: set color here
        Draw.setColor(self.light_colors[i])
        local ang = (i * (math.pi/(#self.light_colors/2))) + (self.time * math.pi / 4)
        local x, y = math.cos(ang), math.sin(ang)
        love.graphics.circle("fill",x*200,y*200,60)
    end
end

return CoolLights