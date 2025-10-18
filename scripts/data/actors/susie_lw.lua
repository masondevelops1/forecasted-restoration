---@class Actor.susie_lw : Actor
local actor, super = Class("susie_lw", true)

function actor:init()
    super.init(self)
    self.default = "walk"
     -- Path to this actor's sprites (defaults to "")
    self.path = "party/susie/light"
    -- Table of sprite animations
        Utils.merge(self.animations, {

        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 1/6, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/act", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},
        ["battle/swooned"]      = {"battle/swooned", 1/15, false},

        ["battle/transition"]   = {self.default.."/right_1", 1/15, false},
        ["battle/intro"]        = {"battle/attack", 1/15, true},
        ["battle/victory"]      = {"battle/victory", 1/10, false},

        ["battle/rude_buster"]  = {"battle/rudebuster", 1/15, false, next="battle/idle"},
    }, false)
end
function actor:getDefault()
    if not (Game and Game.world and Game.world.map and Game.world.map.id) then
        return super.getDefault(self)
    end
    if Utils.startsWith(Game.world.map.id, "gateway/") then
        if Mod.shared_gonerbg and Mod.shared_gonerbg.saturation > 0 then
            return "walk_stressed"
        end
        return "walk_unhappy"
    end
    return super.getDefault(self)
end

return actor