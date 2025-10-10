---@class Wave.scrapscallion.pipeleak : Wave
local wave, super = Class(Wave)

function wave:init()
    super.init(self)
end

function wave:onStart()
    ---@type Bullet.scrapscallion.pipe
    self.pipe = --[[@as Bullet.scrapscallion.pipe]] self:spawnBulletTo(Game.battle.arena, "scrapscallion/pipe", Game.battle.arena.width/2, 0)
    self.pipe.delay = .6 / (#Game.battle.waves == 1 and 3 or 1)
end

return wave