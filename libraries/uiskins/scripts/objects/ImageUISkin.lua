---@class ImageUISkin : UISkin
local ImageUISkin, super = Class("UISkin")

function ImageUISkin:init(name)
    self.speed = 10

    self.left_frame   = 0
    self.top_frame    = 0
    self.corner_frame = 0

    self.left   = Assets.getFramesOrTexture("ui/box/" .. name .. "/left")
    self.top    = Assets.getFramesOrTexture("ui/box/" .. name .. "/top")
    self.corner = Assets.getFramesOrTexture("ui/box/" .. name .. "/corner")

    self.corners = {{0, 0}, {1, 0}, {1, 1}, {0, 1}}
end

function ImageUISkin:getBorder()
    return self.left[1]:getWidth()*2, self.top[1]:getHeight()*2
end

function ImageUISkin:draw(width, height, color, fill)
    self.left_frame   = ((self.left_frame   + (DTMULT / self.speed)) - 1) % #self.left   + 1
    self.top_frame    = ((self.top_frame    + (DTMULT / self.speed)) - 1) % #self.top    + 1
    self.corner_frame = ((self.corner_frame + (DTMULT / self.speed)) - 1) % #self.corner + 1

    local left_width  = self.left[1]:getWidth()
    local left_height = self.left[1]:getHeight()
    local top_width   = self.top[1]:getWidth()
    local top_height  = self.top[1]:getHeight()

    local  r, g, b,a = Utils.unpackColor(color)
    local fr,fg,fb   = Utils.unpackColor(fill or {0,0,0})
    Draw.setColor(fr,fg,fb,a)
    love.graphics.rectangle("fill", 0, 0, width, height)

    Draw.setColor(r, g, b, a)

    Draw.draw(self.left[math.floor(self.left_frame)], 0, 0, 0, 2, height / left_height, left_width, 0)
    Draw.draw(self.left[math.floor(self.left_frame)], width, 0, math.pi, 2, height / left_height, left_width, left_height)

    Draw.draw(self.top[math.floor(self.top_frame)], 0, 0, 0, width / top_width, 2, 0, top_height)
    Draw.draw(self.top[math.floor(self.top_frame)], 0, height, math.pi, width / top_width, 2, top_width, top_height)

    for i = 1, 4 do
        local cx, cy = self.corners[i][1] * width, self.corners[i][2] * height
        local sprite = self.corner[math.floor(self.corner_frame)]
        local width  = 2 * ((self.corners[i][1] * 2) - 1) * -1
        local height = 2 * ((self.corners[i][2] * 2) - 1) * -1
        Draw.draw(sprite, cx, cy, 0, width, height, sprite:getWidth(), sprite:getHeight())
    end
end

return ImageUISkin