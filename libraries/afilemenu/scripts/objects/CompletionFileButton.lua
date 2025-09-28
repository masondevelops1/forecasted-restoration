---@class CompletionFileButton : FileButton
---@overload fun(): CompletionFileButton
local CompletionFileButton, super = Class(FileButton)

function CompletionFileButton:setData(data)
    super.setData(self, data)
    self.name = data and data.name or "Completion FILE not found."
    if not(data and data.playtime) then
        self.time = ""
    end
    self.area = data and data.room_name or "[Made on seeing credits.]"
end


return CompletionFileButton