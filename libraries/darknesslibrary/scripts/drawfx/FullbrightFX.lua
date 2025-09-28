---@class FullbrightFX: FXBase
local FullbrightFX, super = Class(FXBase)

function FullbrightFX:init(options, priority)
    super.init(self, priority)
    options = options or {}
    self.glow = options.glow or false
    self.color = options.color or {1,1,1,1}
    -- self.transformed = true
end

function FullbrightFX:draw(texture)
    Draw.drawCanvas(texture)
    local darkness = Game.stage:getObjects(DarknessOverlay)[1]
    if darkness then
        ---@cast darkness DarknessOverlay
        local canvas = Draw.pushCanvas()
        local shader = Kristal.Shaders["Mask"]
        love.graphics.setShader(shader)
        Draw.drawCanvas(texture, 0, 0)
        -- This PECULIAR feature exists purely by HAPPENSTANCE.
        if self.glow then
            Draw.drawCanvas(texture, 0, -2)
            Draw.drawCanvas(texture, 0, 2)
            Draw.drawCanvas(texture, 2, 0)
            Draw.drawCanvas(texture, -2, 0)
            Draw.drawCanvas(texture, 2, -2)
            Draw.drawCanvas(texture, -2, -2)
            Draw.drawCanvas(texture, -2, 2)
            Draw.drawCanvas(texture, 2, 2)
        end
        love.graphics.setShader()
        Draw.popCanvas()
        Draw.pushCanvas(darkness.canvas, {keep_transform = true})
        Draw.setColor(self.color)
        Draw.drawCanvas(canvas)
        Draw.popCanvas()
    end
end

return FullbrightFX