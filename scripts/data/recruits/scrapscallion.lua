---@class Recruit.scrapscallion : Recruit
local recruit, super = Class(Recruit, "scrapscallion")

function recruit:init()
    super.init(self)
    self.name = "Scrapscallion"
    self.element = "UHHH"
    ------------------------------| <- END HERE
    self.description = [[
Not to be confused with the dish.
Test fucking description.
]]
    self.like = "Magnets"
    self.dislike = "Scallions"
    self.level = 8
    self.recruit_amount = 4
    self.chapter = 6
    self.recruited = true
end

return recruit