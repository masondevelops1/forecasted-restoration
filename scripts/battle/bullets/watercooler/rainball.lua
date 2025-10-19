local RainBallBullet, super = Class(Bullet)

function RainBallBullet:init(x, y, special)
    super.init(self, x, y, "battle/bullets/rainball")
	self:setOrigin(0.5)
	self.destroy_on_hit = false
	self.size = 1
	self:setScale(self.size / 2)
	self.timer = 0
	self.threshold = 3
	self.count = 0
	self.amount = 1
	self.special = special
	self.start_x = self.x
	self.start_y = self.y
	self.siner = 0
	
	self.side = Utils.randomSign()
	self.bullets = {}
	self.regrazetimer = 0
	self.collider = CircleCollider(self, 20, 20, 16)
	self.bullet_collider = CircleCollider(self, 20, 20, 20)
end

function RainBallBullet:update()
    super.update(self)
	
	self.timer = self.timer + DTMULT
	
	if self.timer >= self.threshold then
		local bulletangle = math.rad(math.floor(Utils.random(360)))
		local bulletdist = 150
		local bulletgravity = 0.2
		local heartangle = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
		if self.count == 4 then
			bulletangle = heartangle + math.rad(Utils.random(-30, 30))
		end
		if self.count == 5 then
			bulletangle = heartangle
			self.count = 0
		end
		local bullet = self.wave:spawnBullet("watercooler/rainbullet", self.x + math.cos(bulletangle) * bulletdist, self.y + math.sin(bulletangle) * bulletdist)
		bullet.bulgravity = bulletgravity
		bullet.buldist = bulletdist
		bullet.bulangle = bulletangle
		bullet.bulspeed = 0
		bullet.alpha = 0
		bullet.tp = 0.4
		bullet:setScale(1)
		table.insert(self.bullets, bullet)
		Assets.playSound("wing", 0.3 + (self.size/8), 0.5 + Utils.random(0.1))
		self.count = self.count + 1
		self.timer = 0
	end
	local to_remove = {}
	
	if self.amount > 1 and (Game.battle.wave_timer < Game.battle.wave_length - (10/30)) then
		for _,bullet in ipairs(self.bullets) do
			if self.bullet_collider:collidesWith(bullet.collider) then
				table.insert(to_remove, bullet)
			end
		end
	end
	
	for _,bullet in ipairs(self.bullets) do
		bullet.rotation = bullet.bulangle + math.rad(180)
		bullet.alpha = bullet.alpha + 0.1 * DTMULT
		bullet.bulspeed = bullet.bulspeed + bullet.bulgravity*DTMULT
		bullet.buldist = bullet.buldist - bullet.bulspeed*DTMULT
		bullet.x = self.x + math.cos(bullet.bulangle) * bullet.buldist
		bullet.y = self.y + math.sin(bullet.bulangle) * bullet.buldist
		if bullet.buldist <= 0 + 20 then
			table.insert(to_remove, bullet)
		end
	end
	
    for _,bullet in ipairs(to_remove) do
		self.size = self.size + 0.05
		local effect = self.wave:spawnSprite("battle/bullets/raindrop_splash/splash", bullet.x, bullet.y)
        effect:setOrigin(0.5, 0.5)
        effect:setScale(0.5, 0.5)
        effect.rotation = bullet.rotation + math.rad(270)
		effect.layer = self.layer + 1
		effect:play(1/30, false, function(s) s:remove() end)
		if Game.battle.wave_timer > Game.battle.wave_length - (10/30) then
			effect:remove()
		end
		Assets.playSound("bump", 0.5, 0.5 + ((self.size-1)/4))
		bullet:remove()
        Utils.removeFromTable(self.bullets, bullet)
    end
	
	self.regrazetimer = self.regrazetimer + DTMULT
	if self.regrazetimer >= 10 then
		self.grazed = false
		self.regrazetimer = 0
	end
	
	if self.special == 1 then
		self.siner = self.siner + DTMULT
		self.x = self.start_x + ((math.sin(self.siner / 10) * self.siner) / 10) * self.side
	end
	
	if self.special == 2 then
		self.siner = self.siner + DTMULT
		self.x = self.start_x + math.sin(self.siner / 10) * 2
		self.y = self.start_y + math.cos(self.siner / 10) * 2
		local angleadd = math.rad(math.sin(self.siner / 20) * 2)
		for _,bullet in ipairs(self.bullets) do
			bullet.bulangle = bullet.bulangle + angleadd * DTMULT
		end
	end
	
	if self.special == 3 or self.special == 4 then
		self.siner = self.siner + DTMULT
		self.threshold = 8
		self.x = Game.battle.arena.x + (math.sin(self.siner / 40) * 50) * self.side
		self.y = Game.battle.arena.y + (math.cos(self.siner / 40) * 50) * self.side
		if self.special == 4 then
			for _,bullet in ipairs(self.bullets) do
				bullet.bulangle = bullet.bulangle + math.rad(1 * self.side) * DTMULT
			end
		end
	end
	
	self:setScale(self.size / 2)
end

return RainBallBullet