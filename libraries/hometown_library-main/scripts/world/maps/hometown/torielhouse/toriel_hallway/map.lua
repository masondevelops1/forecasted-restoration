---@class Map.toriel_hallway : Map
local map, super = Class(Map)

function map:init(world, data)
    super.init(self, world, data)
end

function map:onEnter()
    Game.world.music:play("snore", .7, 0.5)
    Game.world.player:addFX(PaletteFX("party/kris/light/palette", 1))
    for _, m in ipairs(Game.stage:getObjects(MirrorArea)) do
        m:addFX(PaletteFX("party/kris/light/palette", 1))
    end
    super.onEnter(self)
end

return map