---@class Event.eglift : Event
local event, super = Class(Event, "eglift")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.lift = Sprite("objects/evergroves/lift", 14, 92)
    self.lift:setScale(2)
    self:addChild(self.lift)
    self.frame = Sprite("objects/evergroves/liftframe_1")
    self.frame:setScale(2)
    self:addChild(self.frame)
    self.frame.cutout_bottom=40
end

function event:update()
    self.frame.cutout_bottom = (((self.frame.height/2)-(self.lift.y/2)) + (34))
    super.update(self)
end

return event