---@class Textbox : Textbox
local Textbox, super = Class("Textbox")

function Textbox:setActor(actor)
    super.setActor(self, actor)
    local skin = self.actor and self.actor:getUISkin()
    if skin then
        self.box:setSkin(skin)
    end
end

return Textbox