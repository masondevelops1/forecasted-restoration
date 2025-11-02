---@class Quest : Class
---@overload fun(): Class
local Quest = Class(nil, "Quest")
function Quest:init()
    self.name = "Untitled Quest " .. (self.id or "???")
    self.description = "No description."
    self.progress = -1
    self.progress_max = 1
    self.flags = {}
end

function Quest:setFlag(flag, value)
    self.flags[flag] = value
end
function Quest:getFlag(flag, default)
    if self.flags[flag] == nil then
        return default
    else
        return self.flags[flag]
    end
end
function Quest:addFlag(flag, value)
    self:setFlag(flag, self:getFlag(flag, 0) + value)
end

-- Unlocks a quest by id, quest are located at "libraries\questline2\scripts\data\quests"
function Quest:unlock(...)
    self:setProgress(math.max(self:getProgress(), 0))
    Kristal.callEvent("unlockQuest", self, ...)
end

--Completes a quest by id, quests are located at "libraries\questline2\scripts\data\quests"
function Quest:complete(...)
    self:setProgress(math.max(self:getProgress(), 100))
    Kristal.callEvent("completeQuest", self, ...)
end

-- Checks if the Quest is unlocked (by checking if the quest progress is more than 0)
function Quest:isUnlocked()
    return (self:getProgress() >= 0)
end

-- Checks if the Quest is currently visible (by checking if it's unlocked but don't tell anyone lol)
function Quest:isVisible()
    return self:isUnlocked()
end

-- Sets the quest progress
---@param v number Progress to set
function Quest:setProgress(v) self.progress = v end
-- Add progress to quest
---@param v number Progress to add
function Quest:addProgress(v) self:setProgress(self:getProgress() + v) end

-- Gets the name of the quest
---@return string name Quest Name
function Quest:getName() return self.name end
-- Gets the description of the quest
---@return string description Quest Description
function Quest:getDescription() return self.description end
-- Gets the progress of the quest
---@return integer progress Quest Progress
function Quest:getProgress() return self.progress end
-- Gets the max progress of the quest
---@return integer maxProgress Max Quest progress
function Quest:getProgressMax() return self.progress_max end
-- Gets the progress percentage of the quest in decimals (0.1-1)
---@return number porcentage Quest Progress Percentage
function Quest:getProgressPercent() return self:getProgress() / self:getProgressMax() end

-- Checks if the quest is completed (by checking if the quest progress is over the max progress)
--@return boolean completed If quest completed
function Quest:isCompleted()
    return self:getProgressPercent() >= 1.0
end

function Quest:save()
    local data = {
        id = self.id,
        progress = self:getProgress(),
        flags = self.flags
    }
    self:onSave(data)
    return data
end

function Quest:load(data)
    self.progress = data.progress
    self.flags = data.flags or {}
    self:onLoad(data)
end

function Quest:onSave(data) end
function Quest:onLoad(data) end


return Quest
