---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "getnoelle")

function MyQuest:init()
    super.init(self)
    self.name = "Get Noelle"



    --self.description = [[[color:blue]Lazul[color:reset] has asked you to deliver a package to a [color:yellow]MAN[color:reset] at the [color:yellow]WARP HUB[color:reset].\nHe said the bin code was [color:yellow]00000000[color:reset].]]
    --if 
    --self.description = {COLORS.blue, "Lazul ", COLORS.white, "has \"asked\" you to deliver a package to a man at the ", COLORS.yellow, "WARP HUB", COLORS.white, ".\nHe said the bin code was ", COLORS.yellow, "00000000", COLORS.white, "."}
    self.description = "You just met up with Susie, but she doesnt want Noelle to miss out on another adventure. Get Noelle at her house blocked by the ornate gate."
    --self.description = {COLORS.white, "White text, ", COLORS.red, "Red text"}
    self.progress_max = 0
end

function MyQuest:getDescription()
	if self:isCompleted() then
		return "You met Noelle! Susie convinced Noelle to come with you to the shelter."
	end
	return self.description
end

return MyQuest
