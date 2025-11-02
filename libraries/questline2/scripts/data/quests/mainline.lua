---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "mainline")
function MyQuest:init()
    if not Plot:isBefore("depths_enter") then
        super.init(self)
        self.name = "Escape the Depths"
        self.description = "You fell into the depths because of a Gateway MELTDOWN. You need to find a way to get out of the Depths to make sure Hometown's okay."
        self.progress = 0
        self.progress_max = 0
    else
        super.init(self)
        self.name = "???"
        self.description = "You do not have any current purpose for this chapter."
        self.progress = 0
        self.progress_max = 0
    end
end
function MyQuest:getDescription()
    if not Plot:isBefore("depths_enter") then
        return "You fell into the depths because of a Gateway MELTDOWN. You need to find a way to get out of the Depths to make sure Hometown's okay."
    else
        return "You do not have any current purpose for this chapter."
    end
end
function MyQuest:getName()
    if not Plot:isBefore("depths_enter") then
        return "Escape the Depths"
    else
        return "???"
    end
end

return MyQuest
