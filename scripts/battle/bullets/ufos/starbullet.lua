local Bullet, super = Class(Bullet)

function Bullet:init(x, y, dir, speed, speedup)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/laserball")
    
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir

    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.physics.friction = -speedup

    self.alpha = 0
end

function Bullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    if self.alpha < 1 then
        self.alpha = self.alpha + (0.2 * DTMULT)
    end

    --self.physics.speed = self.physics.speed * 1.05

    super.update(self)
end

return Bullet