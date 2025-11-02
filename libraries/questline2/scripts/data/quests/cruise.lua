---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "cruise")

function MyQuest:init()
    super.init(self)
    self.name = "The Cruise"



    --self.description = [[[color:blue]Lazul[color:reset] has asked you to deliver a package to a [color:yellow]MAN[color:reset] at the [color:yellow]WARP HUB[color:reset].\nHe said the bin code was [color:yellow]00000000[color:reset].]]
    --if 
    --self.description = {COLORS.blue, "Lazul ", COLORS.white, "has \"asked\" you to deliver a package to a man at the ", COLORS.yellow, "WARP HUB", COLORS.white, ".\nHe said the bin code was ", COLORS.yellow, "00000000", COLORS.white, "."}
    self.description = "The pirates talked about some sort of Cruise that would take you to The Evergroves, home of Dr. O. Find a way onto the cruise."
    --self.description = {COLORS.white, "White text, ", COLORS.red, "Red text"}
    self.progress_max = 0
end

function MyQuest:getDescription()
	if self:isCompleted() then
		return "You got onto the cruise, and with a VIP Suite, too!"
	end
	return self.description
end

return MyQuest
