local StarCircle, super = Class(Wave)

function StarCircle:onStart()
    local ratio = self:getEnemyRatio()

    -- Every 1/8 seconds...
	self.shootangle = 0
    self.timer:every(1/20 * ratio, function()
        -- Get all enemies that selected this wave as their attack
        local attackers = self:getAttackers()
        -- Loop through all attackers
        for _, attacker in ipairs(attackers) do
            -- Get the attacker's center position
            local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)
            -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
            self:spawnBullet("ufos/starbullet", x, y, math.rad(self.shootangle), 0.5, 0.5)
			self.shootangle = math.floor((self.shootangle + 16 + (Utils.random() * 32)) % 360)
        end
    end)
end

function StarCircle:getEnemyRatio()
    local enemies = #Game.battle:getActiveEnemies()
    if enemies <= 1 then
        return 1.25
    elseif enemies >= 2 then
        return 2.5
    end
end

return StarCircle