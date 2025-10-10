---@class PartyMember.kris : PartyMember
local kris, super = Class("kris", true)

function kris:init()
    super.init(self)
    self:setDepthsActor("kris_depths")
    self:setDuskActor("kris_dusk")
    if Game.chapter >= 6 and Game.chapter < 7 then
        self:setActor("kris_mantle")
    end
    self.health = 340
    self.stats.health = 340
    self.max_stats.health = 340
end

return kris