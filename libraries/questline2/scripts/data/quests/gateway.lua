---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "gateway")

function MyQuest:init()
    super.init(self)
    self.name = "Gateway Lockdown"



    --self.description = [[[color:blue]Lazul[color:reset] has asked you to deliver a package to a [color:yellow]MAN[color:reset] at the [color:yellow]WARP HUB[color:reset].\nHe said the bin code was [color:yellow]00000000[color:reset].]]
    --if 
    --self.description = {COLORS.blue, "Lazul ", COLORS.white, "has \"asked\" you to deliver a package to a man at the ", COLORS.yellow, "WARP HUB", COLORS.white, ".\nHe said the bin code was ", COLORS.yellow, "00000000", COLORS.white, "."}
    self.description = "You just found out about the Gateway and how it's locked down. Disable the lockdown and try to find out more about the strange Dr. Omnis."
    --self.description = {COLORS.white, "White text, ", COLORS.red, "Red text"}
    self.progress_max = 0
end

function MyQuest:getDescription()
	if self:isCompleted() then
		return "You deactivated the Gateway Lockdown. Now you can access Sector B!"
	end
	return self.description
end

return MyQuest
