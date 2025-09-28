---@class PartyMember.ursula : PartyMember
local chara, super = Class(PartyMember, "ursula")

function chara:init()
    super.init(self)
    self.name = "Ursula"
    self.title = "groovy"
    self:setActor("ursula")
    self.menu_icon = "party/ursula/head"
    self.head_icons = "party/ursula/icon"
    self.color = {0.98, 0.34, 0}
    self:setWeapon("ragger") --good enough just dont look in the menu
    self.has_spells = true
    self.has_act = false
end

function chara:getTitle()
    local t = super.getTitle(self) .. "\n"
    for i = 1, 10, 1 do
        t = t .. self.title .. "yyyyyyy\n"
    end
    return t
end

return chara