---@class Battle : Battle
local Battle, super = Class("Battle")

function Battle:isBleeding()
    return Input.down("menu")
end

return Battle