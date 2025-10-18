local Dual_MovingArena, super = Class(Wave)

function Dual_MovingArena:init()
    super.init(self)

    -- Initialize timer
    self.siner = 0

    self.time = 8

end

function Dual_MovingArena:onStart()
    -- Get the arena object
    local arena = Game.battle.arena

    -- Spawn spikes on top of arena
    self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, 0, math.rad(0))

    -- Spawn spikes on bottom of arena (rotated 180 degrees)
    self.skull = self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, arena.height, math.rad(180))

    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y

    Game.battle.arena:setColor(1, 1, 1)


        local x = Game.battle.soul.x
        -- Get a random Y position between the top and the bottom of the arena
        local y = SCREEN_HEIGHT + 10

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        self.bullet = self:spawnBullet("battle/bullets/star", x, y, math.rad(180))
        self.bullet.graphics.spin = 0.15
        Assets.playSound("bomb", 0.5)
        --self.bullet.physics.friction = -1
        self.bullet.bullet_dead = false

function self.bullet:onCollide(soul)
	if not Game.battle.superpower then
		if soul.inv_timer == 0 then
			self:onDamage(soul)
		end

		if self.destroy_on_hit then
                        self.bullet_dead = true
			self:remove()
		end
	end
end

        self.bullet.physics.speed_y = -0.5

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        self.bullet.remove_offscreen = false



end

function Dual_MovingArena:update()

    if self.bullet.y <= 0 then
        self.bullet.physics.friction = 0
        self.bullet.physics.speed_y = 0

        self.bullet.y = 5
        self.bullet.physics.friction = -1
        self.bullet.physics.speed_y = 0.5
        Assets.playSound("back_attack", 0.5, 0.5)
    elseif self.bullet.y >= SCREEN_HEIGHT then
        self.bullet.physics.friction = 0
        self.bullet.physics.speed_y = 0

        self.bullet.y = SCREEN_HEIGHT - 5
        self.bullet.physics.friction = -1
        self.bullet.physics.speed_y = -0.5
        Assets.playSound("back_attack", 0.5, 0.5)
    end
    local coal = math.random(2, -2)*5
    local ball = math.random(2, -2)*5

    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local offset = math.sin(self.siner * 1.5) * 60

    -- Move the arena
    Game.battle.arena:setPosition(self.arena_start_x + coal, self.arena_start_y + offset + ball)

    Game.battle.arena.rotation = self.siner

    Game.battle.soul.rotation = -self.siner


    self.skull.y = Game.battle.arena.height

    Game.battle.arena.height = 180 + offset

    self.skull.y = Game.battle.arena.height

    if self.bullet.bullet_dead == true then
        self.bullet.bullet_dead = false
        Assets.playSound("bomb", 0.5)
        local x = Game.battle.soul.x
        -- Get a random Y position between the top and the bottom of the arena
        local y = SCREEN_HEIGHT + 10

        self.bullet = self:spawnBullet("battle/bullets/star", x, y, math.rad(180))
        self.bullet.graphics.spin = 0.15
        self.bullet.physics.speed_y = -0.5


function self.bullet:onCollide(soul)
	if not Game.battle.superpower then
		if soul.inv_timer == 0 then
			self:onDamage(soul)
		end

		if self.destroy_on_hit then
                        self.bullet_dead = true
			self:remove()
		end
	end
end


    end

    super.update(self)
end

return Dual_MovingArena