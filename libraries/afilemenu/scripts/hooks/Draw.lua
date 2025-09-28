---@type metatable
local _mt = {__index = Draw}

---@class Draw
local Draw = setmetatable({}, _mt)

function Draw.coolRectangle(x, y, w, h)
    -- Make sure the line is a single pixel wide
    love.graphics.setLineWidth(1)
    love.graphics.setLineStyle("rough")
    if Game.world.map.menustyle == "DEVICE" then
        love.graphics.rectangle("line", x, y, w, h)
        return
    end
    -- Draw the rectangles
    love.graphics.rectangle("line", x, y, w + 1, h + 1)
    -- Increase the width and height by one instead of two to produce the broken effect
    love.graphics.rectangle("line", x - 1, y - 1, w + 2, h + 2)
    love.graphics.rectangle("line", x - 2, y - 2, w + 5, h + 5)
    -- Here too
    love.graphics.rectangle("line", x - 3, y - 3, w + 6, h + 6)
end

_mt.__newindex = _mt.__index
return Draw