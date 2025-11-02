---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "mystery")

function MyQuest:init()
    super.init(self)
    self.name = "Boat Mystery"



    --self.description = [[[color:blue]Lazul[color:reset] has asked you to deliver a package to a [color:yellow]MAN[color:reset] at the [color:yellow]WARP HUB[color:reset].\nHe said the bin code was [color:yellow]00000000[color:reset].]]
    --if 
    --self.description = {COLORS.blue, "Lazul ", COLORS.white, "has \"asked\" you to deliver a package to a man at the ", COLORS.yellow, "WARP HUB", COLORS.white, ".\nHe said the bin code was ", COLORS.yellow, "00000000", COLORS.white, "."}
    self.description = "You became a detective onto the boat due to a recent theft. It seems like you'll need to gather clues to solve the mystery."
    --self.description = {COLORS.white, "White text, ", COLORS.red, "Red text"}
    self.progress_max = 0
end

function MyQuest:getDescription()
	if self:isCompleted() then
		return "You found out it was the pirates who stole the ping pong table! While you rested, the boat arrived at The Evergroves."
	end
	return self.description
end

return MyQuest
