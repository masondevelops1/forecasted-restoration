---@class Actor.pirates.susie : Actor.pirates.kris
local actor, super = Class("pirates/kris")

function actor:init()
    super.init(self)
    self.name = "Pirate Susie"
    self.path = "npcs/pirates/susie"
    self.default = "walk"
    self.width = 25
    self.height = 48
    self.offsets = {
        ["ball"] = {-1,19},
    }
end

return actor