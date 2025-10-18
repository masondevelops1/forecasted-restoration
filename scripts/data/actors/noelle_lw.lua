---@class Actor.noelle_lw : Actor
local actor, super = Class("noelle_lw", true)

function actor:init()
    super.init(self)
    self.default = "walk"
    -- Path to this actor's sprites (defaults to "")
    self.path = "party/noelle/light"
   -- Table of sprite animations
    Utils.merge(self.animations, {
        -- Battle animations
        ["battle/idle"]         = {"battle/idle", 1/6, true},

        ["battle/attack"]       = {"battle/attack", 1/15, false},
        ["battle/act"]          = {"battle/act", 1/15, false},
        ["battle/spell"]        = {"battle/spell", 1/15, false, next="battle/idle"},
        ["battle/item"]         = {"battle/item", 1/12, false, next="battle/idle"},
        ["battle/spare"]        = {"battle/spell", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] = {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] = {"battle/defend", 1/15, false},

        ["battle/act_end"]      = {"battle/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},
        ["battle/swooned"]      = {"battle/defeat", 1/15, false},

        ["battle/transition"]   = {"battle/intro", 1/15, false},
        ["battle/victory"]      = {"battle/victory", 1/10, false},
        
        -- Cutscene animations
        ["laugh"]               = {"laugh", 4/30, true},
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