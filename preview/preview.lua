-- This is temporary.

local preview = {}

function preview:init(mod)
    self.DEPTH = love.graphics.newImage(mod.path.."/assets/sprites/world/cutscenes/intro/DEPTH.png")
end

function preview:draw(fade)
    if self.fade <= 0 then return end
    local canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)

    love.graphics.scale(2)
    love.graphics.translate(SCREEN_WIDTH/4, SCREEN_HEIGHT/4)
    love.graphics.scale(2)
    for i = 1,3 do
        Draw.setColor(COLORS.white(.8/i))
        love.graphics.translate(math.sin(RUNTIME*((4-i)/3)), math.sin(RUNTIME*2*((4-i)/3)))
        Draw.draw(self.DEPTH, 0,0,0,1,1, self.DEPTH:getWidth()/2, self.DEPTH:getHeight()/2)
        love.graphics.scale(0.8)
    end

    Draw.popCanvas()
    Draw.setColor(COLORS.white(self.fade))
    Draw.draw(canvas, 0, 0, 0, 1, 1)
end

return preview