local DarkWall, super = Class(Object)

function DarkWall:init()
    super.init(self)
    self.blobX = love.math.random(245, 387)
    self.blobY = -self.blobX + (332 + 150)
end

function DarkWall:update()
    super.update(self)
end

function DarkWall:draw()
    for i = 1, 100 do
        self.blobX = love.math.random(245, 387)
        self.blobY = -self.blobX + (332 + 150)
        Draw.draw(Assets.getTexture("bullets/omnis/darkoutline"), self.blobX, self.blobY)
        Draw.draw(Assets.getTexture("bullets/omnis/darkbullet"), self.blobX, self.blobY)
    end
end

return DarkWall