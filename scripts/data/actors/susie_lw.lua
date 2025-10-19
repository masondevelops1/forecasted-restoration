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
    Utils.merge(self.offsets, {
        -- Movement offsets
        ["slide"] = {-5, -12},

        -- Battle offsets
        ["battle/idle"] = {-22, -1},

        ["battle/attack"] = {-26, -25},
        ["battle/attackready"] = {-26, -25},
        ["battle/act"] = {-24, -25},
        ["battle/actend"] = {-24, -25},
        ["battle/actready"] = {-24, -25},
        ["battle/spell"] = {-22, -30},
        ["battle/spellready"] = {-22, -15},
        ["battle/item"] = {-22, -1},
        ["battle/itemready"] = {-22, -1},
        ["battle/defend"] = {-20, -23},
        ["battle/swooned"] = {0, 0},

        ["battle/defeat"] = {-22, -1},
        ["battle/hurt"] = {-22, -1},

        ["battle/victory"] = {-28, -7},

        ["battle/rudebuster"] = {-44, -33},
        
        -- Cutscene offsets
        ["pose"] = {-1, -1},

        ["ball"] = {1, 7},
        ["landed"] = {-5, -2},

        ["shock_left"] = {0, -4},
        ["shock_right"] = {-16, -4},
        ["shock_up"] = {-6, 0},

        ["point_left"] = {-11, 2},
        ["point_right"] = {0, 2},
        ["point_up"] = {-2, -12},

        ["point_up_turn"] = {-4, -12},

        ["bangs_wall_left"] = {0, -2},
        ["bangs_wall_right"] = {0, -2},

        ["exasperated_left"] = {-1, 0},
        ["exasperated_right"] = {-5, 0},

        ["away"] = {-2, -2},
        ["away_turn"] = {-1, -2},
        ["away_hips"] = {-2, -1},
        ["away_hand"] = {-2, -2},

        ["t_pose"] = {-6, 0},

        ["fell"] = {-18, -2},

        ["kneel_right"] = {-4, -2},
        ["kneel_left"] = {-12, -2},

        ["diagonal_kick_right"] = {-5, -1},
        ["diagonal_kick_left"] = {-3, -1},
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