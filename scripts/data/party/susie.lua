---@class PartyMember.susie : PartyMember
local susie, super = Class("susie", true)

function susie:init()
    super.init(self)
    self:setDepthsActor("susie_depths")
    self.health = 410
    self.stats.health = 410
    self.max_stats.health = 410
end

return susie