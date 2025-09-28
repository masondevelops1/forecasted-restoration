---@class Actor.pirates.noelle : Actor.pirates.kris
local actor, super = Class("pirates/kris")

function actor:init()
    super.init(self)
    self.name = "Pirate Noelle"
    self.path = "npcs/pirates/noelle"
    self.default = "walk"
    self.width = 23
    self.height = 47
    self.offsets = {
        ["ball"] = {1,25}
    }
end

return actor