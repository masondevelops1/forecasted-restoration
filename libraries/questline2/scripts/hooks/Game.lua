---@class (hook) Game
local Game, super = HookSystem.hookScript(Game)

---@deprecated Use QuestlineLib:getQuest instead.
function Game:getQuest(id)
    return QuestlineLib:getQuest(id)
end

return Game
