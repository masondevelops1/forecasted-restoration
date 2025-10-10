local Beam, super = Class(Bullet)

function Beam:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/beam_indicator")

    self.sprite:play(1/6, false)

    Assets.playSound("alert")

    self:setHitbox(10, 0, self.width-20, self.height)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.destroy_on_hit = false

    self.collidable = false

    self:setScale(1)

    Game.stage.timer:after(1, function ()
        Assets.playSound("critical_swing")
        self.collidable = true
        self.sprite:setAnimation({"bullets/beam", 1/14, false})
        Game.stage.timer:after(0.5, function ()
            self:remove()
        end)
    end)
end

function Beam:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return Beam