---@class Actor.pirates.kris : Actor
local actor, super = Class(Actor, "pirates/kris")

function actor:init()
    super.init(self)
    self.name = "Pirate Kris"
    self.default = ""
    self.miniface = "face/mini/pirates"
    self.path = "npcs/pirates/kris"
    self.default = "walk"
    self.width = 22
    self.height = 39
    self.animations = {
        ["hit"] = {"hit", 0.1, true},
        ["jump_ball"] = {"ball", 0.1, true}
    }
    self.offsets = {
        ["hit"] = {-6, 0},
        ["ball"] = {1,16},
    }
end

return actor