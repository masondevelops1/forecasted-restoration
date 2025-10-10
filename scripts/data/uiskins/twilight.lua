---@class UISkin.twilight : UISkin
local twilight, super = Class(UISkin)

function twilight:draw(width, height, color, fill)
    Draw.setColor(COLORS.gray)
    for i=2,0,-1 do
        local padding = 16 + (((math.sin(RUNTIME*math.pi*2)/2)+1) * i * 3)
        Draw.setColor(color, 0.4)
        if i == 0 then
            Draw.setColor(fill, 0.8)
        end
        love.graphics.rectangle("fill", -padding,-padding,width+(padding*2), height+(padding*2))
    end
end

return twilight