---@class Event.candle : Event
local event, super = Class(Event, "candle")

function event:init(data)
    super.init(self,data)
end
function event:onAdd(parent)
    super.onAdd(self,parent)
    self.lightsource = LightSource(self.width/2,4)
    self.ellipse = Ellipse(0,0,10,10)
    -- TODO: This color sucks fizz please pick a better one
    self.ellipse:setColor(Utils.hexToRgb("#ffeeaa"))
    self:addChild(self.lightsource)
    self.lightsource:addChild(self.ellipse)
end

function event:update()
    super.update(self)
    -- from my understanding... flash time, ellipse size, and flicker size in that order
    self.ellipse.width = Utils.wave(RUNTIME * math.pi * 10, 18, 22)
    self.ellipse.height = self.ellipse.width
end


---@param map Map
function event:applyTileObject(data, map)
    self.tile = map:createTileObject(data, 0, 0, self.width, self.height)

    local ox, oy = self.tile:getOrigin()
    self:setOrigin(ox, oy)

    self.tile:setPosition(ox * self.width, oy * self.height)

    self:addChild(self.tile)
end

return event