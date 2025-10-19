local WatercoolerRain, super = Class(Wave)

function WatercoolerRain:init()
	super.init(self)
	self.time = 300/30
    self.soul_offset_x = -10+8
    self.soul_offset_y = 18+8
end

function WatercoolerRain:onStart()
    local rainball_1 = self:spawnBullet("watercooler/rainball", Game.battle.arena.x - 50, Game.battle.arena.y, 1)
    rainball_1.threshold = 7
    rainball_1.side = -1
    rainball_1.amount = 2
    local rainball_2 = self:spawnBullet("watercooler/rainball", Game.battle.arena.x + 50, Game.battle.arena.y, 1)
    rainball_2.threshold = 7
    rainball_2.side = 1
    rainball_2.amount = 2
end

return WatercoolerRain