local StarSides, super = Class(Wave)

function StarSides:onStart()
    local ratio = self:getEnemyRatio()

    -- Every 1/5 seconds...
    self.timer:every(1/5 * ratio, function()
        -- Get a random side
		local x = 0
		local direction = 180
		if Utils.random() < 0.5 then
			x = SCREEN_WIDTH - 16
		else
			x = 0
			direction = 0
		end
        -- Get a random Y position between the top and the bottom of the arena
        local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("ufos/starbullet", x, y, math.rad(direction), 3, 0.3)
        bullet.remove_offscreen = true
    end)
end

function StarSides:getEnemyRatio()
    local enemies = #Game.battle:getActiveEnemies()
    if enemies <= 1 then
        return 1
    elseif enemies >= 2 then
        return 1.6
    end
end

return StarSides