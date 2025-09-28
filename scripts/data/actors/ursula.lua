---@class Actor.ursula : Actor
local actor, super = Class(Actor, "ursula")

function actor:init()
    super.init(self)
    self.path = "party/ursula/dark"
    self.width = 30
    self.height = 46
    self.default = "walk"
    self.offsets = {
        -- Movement Offsets
        ["walk"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        -- Nah
        ["battle/idle"] = {0, 0},
        ["battle/defeat"] = {-10, 0},
    }

    self.animations = {
        ["battle/defeat"]      = {"battle/defeat", 1/15, false},
        ["battle/swooned"]      = {"battle/defeat", 1/15, false},
    }
end

return actor
