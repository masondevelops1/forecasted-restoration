---@class Event.gatewayentry : Event
local event, super = Class(Event, "gatewayentry")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.gonerbg = AdvancedGonerBackground()
    self.gonerbg.no_reset_transform = true
    self.gonerbg:setPosition(self.width/2, self.height/2)
    self.gonerbg:setScale(1)
    self.gonerbg.sprite = love.graphics.newImage(Assets.getTextureData(Assets.getTextureID(self.gonerbg.sprite)))
    self.gonerbg.sprite:setFilter("linear")
    self.gonerbg.stretch_speed = 0.005
    self.gonerbg.alpha = 2
    self.gonerbg.color = {1, 0.6, 1}
    self:addChild(self.gonerbg)
    self:addFX(MaskFX(self))
    self.visible = false
end

function event:drawMask()
    love.graphics.rectangle("fill", 0,0,self.width+1, self.height)
end

function event:draw()
    love.graphics.clear(0,0,0,1)
    super.draw(self)
end

return event