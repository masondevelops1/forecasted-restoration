---@class Event.parallax_tile : Event
local event, super = Class(Event, "parallax_tile")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.parallax_x = properties["px"] or 1
    self.parallax_y = properties["py"] or 1
    properties.usetile = true
end

function event:applyTileObject(data, map)
   local tile = map:createTileObject(data, 0, 0, self.width, self.height)

   local ox, oy = tile:getOrigin()
   self:setOrigin(ox, oy)

   tile:setPosition(ox * self.width, oy * self.height)

   self:addChild(tile)
end

return event