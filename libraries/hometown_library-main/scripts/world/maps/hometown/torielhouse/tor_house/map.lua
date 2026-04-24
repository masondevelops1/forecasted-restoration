---@class Map.tor_house : Map
local map, super = Class(Map)

function map:init(world, data)
    super.init(self, world, data)
end

function map:onEnter()
    Game.world.music:play("snore", .5, 0.5)
    Game.world.player:addFX(PaletteFX("party/kris/light/palette", 1))
    super.onEnter(self)
end

function map:onExit()
    Game.world.music:setPitch(1)
    Game.world.music:setVolume(1)
    super.onEnter(self)
end

return map