---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "meetsusie")

function MyQuest:init()
    super.init(self)
    self.name = "Meet Susie"

    --self.description = [[[color:blue]Lazul[color:reset] has asked you to deliver a package to a [color:yellow]MAN[color:reset] at the [color:yellow]WARP HUB[color:reset].\nHe said the bin code was [color:yellow]00000000[color:reset].]]
    --if 
    --self.description = {COLORS.blue, "Lazul ", COLORS.white, "has \"asked\" you to deliver a package to a man at the ", COLORS.yellow, "WARP HUB", COLORS.white, ".\nHe said the bin code was ", COLORS.yellow, "00000000", COLORS.white, "."}
    self.description = "Susie found something strange. She's waiting by QC's for you."

    self.progress_max = 0
end

function MyQuest:getDescription()
	if self:isCompleted() then
		return "You met Susie! She told you she found the shelter doors open and that it didn't look like there was a dark world in it."
	end
	return self.description
end

return MyQuest
