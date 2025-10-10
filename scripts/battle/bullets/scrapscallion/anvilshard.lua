---@class Bullet.scrapscallion.anvilshard : Bullet
local anvilshard, super = Class(Bullet)

function anvilshard:init(x, y, dir, speed)
    super.init(self, x, y, "bullets/scrapscallion/anvil_pieces/a")

    self.destroy_on_hit = false

    self.physics.speed = speed
    self.physics.direction = dir

    self:setScale(1)

    self.piece = "a"

    self.physics.gravity = 1
end

function anvilshard:update()
    super.update(self)

    self:setSprite("bullets/scrapscallion/anvil_pieces/" .. self.piece)
end

return anvilshard