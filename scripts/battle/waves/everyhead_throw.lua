local EveryheadThrow, super = Class(Wave)

function EveryheadThrow:init()
    super.init(self)
    -- The time the wave runs for(in seconds I think)
    self.time = 10

    self.bullets = {}
end

function EveryheadThrow:onStart()
    local attackers = self:getAttackers()

    --local thingie = ArenaImage()

    --self:addChild(thingie)

    self.timer:everyInstant(0.5, function() 

        local attackers = self:getAttackers()

        for _, attacker in ipairs(attackers) do

            -- Get the attacker's center position
            local x, y = attacker:getRelativePos(attacker.width/2+2, -5)

            -- Get the angle between the bullet position and the soul's position
            local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

            -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/omnis/darkbullet.lua)
            self:spawnBullet("growhead", x, y, angle, 0)
        end
    end)
end

return EveryheadThrow