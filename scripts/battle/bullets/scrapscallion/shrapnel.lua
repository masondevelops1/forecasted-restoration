local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/scrapscallion/shrapnel")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    self.physics.gravity = .05
    self.physics.speed_y = -1
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    local prev_x, prev_y = self:getPosition()
    super.update(self)
    self.rotation = Utils.angle(prev_x, prev_y, self:getPosition())
end

return SmallBullet