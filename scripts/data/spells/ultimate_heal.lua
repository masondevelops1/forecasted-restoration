---@class Spell.ultimate_heal : Spell
local spell, super = Class("ultimate_heal", true)

function spell:init()
    super.init(self)

    -- Display name
    self.name = "LameHeal"
    -- Name displayed when cast (optional)
    self.cast_name = "LameHeal"

    -- Battle description
    self.effect = "Stupid\nhealing"
    -- Menu description
    self.description = "Heals 1 party member. It's pretty lame."

    -- TP cost
    self.cost = 95

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"heal"}
end

function spell:onCast(user, target)
    target:heal((user.chara:getStat("magic") + 3) * 65)
end

return spell