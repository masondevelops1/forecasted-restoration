local WatercoolerRain, super = Class(Wave)

function WatercoolerRain:init()
	super.init(self)
	self.time = 300/30
    self.soul_offset_x = -10+8
    self.soul_offset_y = 18+8
end

function WatercoolerRain:onStart()
    local bullet = self:spawnBullet("watercooler/rainball", Game.battle.arena.x, Game.battle.arena.y, 0)
end

return WatercoolerRain