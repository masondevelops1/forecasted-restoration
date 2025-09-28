---@class DepthsWaterOutline : Outline
---@overload fun(x: number, y: number, w: number, h: number) : DepthsWaterOutline
local DepthsWaterOutline, super = Class(Outline)

function DepthsWaterOutline:draw()
    super.super.draw(self)
    Draw.setColor(COLORS.black)
    love.graphics.rectangle("fill", 0,0,self.width,self.height)

    local canvas = Draw.pushCanvas(self.width, self.height)
    love.graphics.clear()

    love.graphics.translate(-self.x, -self.y)

    for _, object in ipairs(Game.world.children) do
        if object:includes(Character) then
            love.graphics.stencil((function () self:drawMask(object) end), "replace", 1)
            love.graphics.setStencilTest("less", 1)

            love.graphics.setShader(Kristal.Shaders["AddColor"])

            Kristal.Shaders["AddColor"]:sendColor("inputcolor", { 1,1,1 })
            Kristal.Shaders["AddColor"]:send("amount", 1)

            local size = 2
            love.graphics.translate(-size, 0)
            self:drawCharacter(object)
            love.graphics.translate(size, 0)

            love.graphics.translate(size, 0)
            self:drawCharacter(object)
            love.graphics.translate(-size, 0)

            love.graphics.translate(0, size)
            self:drawCharacter(object)
            love.graphics.translate(0, -size)

            love.graphics.translate(0, -size)
            self:drawCharacter(object)
            love.graphics.translate(0, size)

            love.graphics.setShader()

            love.graphics.setStencilTest()
        end
    end

    Draw.popCanvas()
    love.graphics.setShader(Kristal.Shaders["AddColor"])
    Kristal.Shaders["AddColor"]:sendColor("inputcolor", { 1,1,1 })
    Draw.draw(canvas)
    love.graphics.setShader()
    Draw.setColor(COLORS.white)
    love.graphics.setLineWidth(2)
    love.graphics.line(0,0,self.width,0)
end

return DepthsWaterOutline