local EveryheadBarrage, super = Class(Wave)

function EveryheadBarrage:init()
    super.init(self)
    -- The time the wave runs for(in seconds I think)
    self.time = 20
end

function EveryheadBarrage:onStart()

    --local thingie = ArenaImage()

    --self:addChild(thingie)

    self.timer:everyInstant(2, function() 

        -- Get a randomized angle
        local angle = love.math.random() * 2 * math.pi

        -- Get the bullet's position on a circle with a radius of 200 around the center of the arena
        local x = 200 * math.sin( angle ) + 320
        local y = 200 * math.cos( angle ) + 170

        -- Get the angle between the poition and the center of the arena
        local dir = Utils.angle(x, y, Game.battle.arena.x, Game.battle.soul.y)

        -- Spawn the bullet
        local bullet = self:spawnBullet("explodehead", x, y, dir, 8)
    end)
end

return EveryheadBarrage