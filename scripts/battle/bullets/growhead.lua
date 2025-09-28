local EveryHead, super = Class(Bullet)

function EveryHead:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/spr_strangeman_floathead/spr_growneck")

    self.sprite:play(1/18, false)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    Game.battle.waves[1].timer:after(1/3, function ()
        self.sprite:setAnimation({"bullets/spr_strangeman_floathead/spr_strangeman_floathead", 1/12, true})
        self.physics.speed = 6
    end)
end

function EveryHead:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return EveryHead