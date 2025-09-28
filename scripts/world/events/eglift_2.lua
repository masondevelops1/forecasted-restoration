---@class Event.eglift_2 : Event
local event, super = Class(Event, "eglift_2")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}

    self.lift1 = Sprite("objects/evergroves/lifttop", 14, 0)
    self.lift1:setLayer(-0.11)
    self.lift1:setScale(2)
    self:addChild(self.lift1)

    self.lift2 = Sprite("objects/evergroves/liftbottom", 14, 26)
    self.lift2:setLayer(-0.09)
    self.lift2:setScale(2)
    self:addChild(self.lift2)

    self.rope = Sprite("objects/evergroves/lift_rope", 56, 0)
    self.rope:setScale(2)
    self.rope:setLayer(-0.1)
    self:addChild(self.rope)

    --[[self.frame2 = Sprite("objects/evergroves/liftframe_2", 0, 900)
    self.frame2:setScale(2)
    self.frame2:setLayer(-0.08)
    self:addChild(self.frame2)]]
end

return event