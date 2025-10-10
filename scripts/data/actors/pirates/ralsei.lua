---@class Actor.pirates.ralsei : Actor.pirates.kris
local actor, super = Class("pirates/kris")

function actor:init()
    super.init(self)
    self.name = "Pirate Ralsei"
    self.path = "npcs/pirates/ralsei"
    self.default = "walk"
    self.width = 23
    self.height = 52

    self.offsets = {
        ["hit"] = {0, 0},
        ["ball"] = {1, 30},
    }
end

return actor