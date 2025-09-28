---@class LightSource:Object
local Light, super = Class(Object)

function Light:init(x, y)
    super.init(self, x, y)
    self.alpha = 1
    self.inherit_color = false
    self.style = Kristal.getLibConfig("darkness", "style")
    -- don't allow debug selecting
    self.debug_select = true
end

function Light:preDraw(dont_transform)
    super.preDraw(self, dont_transform)
    local darkness = Game.stage:getObjects(DarknessOverlay)[1]
    if darkness then
        Draw.pushCanvas(darkness.canvas, {keep_transform = true})
    end
    self.prev_mode, self.prev_alphamode = love.graphics.getBlendMode()
    love.graphics.setBlendMode("lighten", "premultiplied")
end

function Light:postDraw()
    love.graphics.setBlendMode(self.prev_mode, self.prev_alphamode)
    if Game.stage:getObjects(DarknessOverlay)[1] then
        Draw.popCanvas()
    end
    super.postDraw(self)
end

return Light