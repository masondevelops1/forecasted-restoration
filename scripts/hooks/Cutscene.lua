---@class Cutscene : Cutscene
local Cutscene, super = Utils.hookScript(Cutscene)

-- Waits until a callback is called. TODO: PR this to Kristal
---@param func fun(callback:function)
function Cutscene:awaitCallback(func)
    local done = false
    local callback = function ()
        done = true
        self:tryResume()
    end
    func(callback)
    self:wait(function ()
        return done
    end)
end

return Cutscene