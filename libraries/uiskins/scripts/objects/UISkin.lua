---@class UISkin : Class
---@field parent UIBox
local UISkin, super = Class()

function UISkin:init()
    self.padding = 24
end

function UISkin:getBorder()
    return self.padding, self.padding, self.padding, self.padding
end

function UISkin:draw(width, height, color, fill)
    Draw.setColor(fill)
    love.graphics.rectangle("fill", -self.padding,-self.padding,width+(self.padding*2),height+(self.padding*2))
    Draw.setColor(color)
    love.graphics.rectangle("line", -self.padding,-self.padding,width+(self.padding*2),height+(self.padding*2))
end

return UISkin