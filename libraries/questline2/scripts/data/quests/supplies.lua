---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "supplies")

function MyQuest:init()
    super.init(self)
    self.name = "Get Supplies"



    --self.description = [[[color:blue]Lazul[color:reset] has asked you to deliver a package to a [color:yellow]MAN[color:reset] at the [color:yellow]WARP HUB[color:reset].\nHe said the bin code was [color:yellow]00000000[color:reset].]]
    --if 
    --self.description = {COLORS.blue, "Lazul ", COLORS.white, "has \"asked\" you to deliver a package to a man at the ", COLORS.yellow, "WARP HUB", COLORS.white, ".\nHe said the bin code was ", COLORS.yellow, "00000000", COLORS.white, "."}
    self.description = "You just got everybody together and are almost ready to head to the shelter. You just need to get some supplies now."
    --self.description = {COLORS.white, "White text, ", COLORS.red, "Red text"}
    self.progress_max = 0
end

function MyQuest:getDescription()
	if self:isCompleted() then
		return "You got all of the supplies you needed, but the earthquakes are getting worse..."
	end
	return self.description
end

return MyQuest
