---@class Recruit.scrapscallion : Recruit
local recruit, super = Class(Recruit, "scrapscallion")

function recruit:init()
    super.init(self)
    self.name = "Scrapscallion"
    self.element = "Scrap:Metal"
    ------------------------------| <- END HERE
    self.description = [[
In a world of darkness, you'll 
always find light.
... This isn't the light you'll 
find.
]]
    self.like = "Magnets"
    self.dislike = "Scallions"
    self.level = 8
    self.recruit_amount = 4
    self.box_gradient_type = "dark"
    self.box_sprite = {"enemies/scrapscallion/battle/idle", 0, 12, 4/30}
    self.chapter = 6
    self.recruited = false
end

return recruit