---@class Map : Map
---@field menustyle string?
local Map, super = Class(Map)

function Map:init(world,data)
    super.init(self,world,data)
    self.menustyle = nil
end

return Map
