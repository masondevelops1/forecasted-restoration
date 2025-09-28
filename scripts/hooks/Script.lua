---@class Script : Script
local Script, super = Utils.hookScript(Script)

function Script:init(x, y, shape, properties)
    super.init(self, x, y, shape, properties)

    properties = properties or {}
    self.properties = properties
end

function Script:setFlag(flag, value)
    if (self.properties.once == nil) and flag == "used_once" then
        return
    end
    return super.setFlag(self, flag, value)
end

return Script