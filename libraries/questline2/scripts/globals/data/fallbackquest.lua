---@class FallbackQuest : Quest
---@overload fun(data: table)
local FallbackQuest, super = Class("Quest", "FallbackQuest")
function FallbackQuest:init(data)
    super.init(self)
    self.name = "Missing " .. (data.id or "???")
    self.description = "It is known."
    self.progress = 0
    self.progress_max = 1000
    self.id = data.id
    self:load(data)
end

function FallbackQuest:isVisible()
    return false
end

return FallbackQuest
