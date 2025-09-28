---@class DarknessOverlay : Object
local Darkness, super = Class(Object)

function Darkness:init(alpha)
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
    -- above everything, including ui, by default
    -- if you want it to be below ui, set its layer
    self.layer = WORLD_LAYERS["below_ui"]

    -- parallax set to 0 so it's always aligned with the camera
    self:setParallax(0, 0)
    -- don't allow debug selecting
    self.debug_select = false

    self.alpha = alpha or 1
    self.overlap = Kristal.getLibConfig("darkness", "overlap")
    self.canvas = love.graphics.newCanvas(SCREEN_WIDTH, SCREEN_HEIGHT, {
        format = "rgba16f",
        dpiscale = 1,
    })
    self:setColor(COLORS.black)
end

function Darkness:applyTransformTo(transform)
    transform:reset()
end

function Darkness:draw()
    love.graphics.setBlendMode("multiply", "premultiplied")
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.canvas)
    love.graphics.setBlendMode("alpha")
    Draw.pushCanvas(self.canvas)
    love.graphics.clear(1,1,1,1)
    local r,g,b,a = self:getDrawColor()
    Draw.setColor(r,g,b,a)
    love.graphics.rectangle("fill", 0, 0, self.canvas:getDimensions())
    Draw.popCanvas()
end

return Darkness