---@class Wave.scrapscallion.boiler : Wave
local wave, super = Class(Wave, "scrapscallion/boiler")

function wave:init()
    super.init(self)
    self.arena_x = 360
end

function wave:onStart()
    local x,y = Game.battle.arena:getBottomLeft()
    self:spawnBullet("scrapscallion/boiler", x + 40, y + 20)
end

return wave