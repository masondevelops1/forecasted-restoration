local StarFade, super = Class(Wave)

function StarFade:onStart()
	self.time = 7
	
    local ratio = self:getEnemyRatio()

    -- Every 1/7 seconds...
    self.timer:every(1/7 * ratio, function()
        -- Get a random side
		local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)
        local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("ufos/starbulletfade", x, y)
        -- Dont remove the bullet offscreen, because we spawn it offscreen
        --bullet.remove_offscreen = true
    end)
end

function StarFade:getEnemyRatio()
    local enemies = #Game.battle:getActiveEnemies()
    if enemies <= 1 then
        return 1
    elseif enemies >= 2 then
        return 1.6
    end
end

return StarFade