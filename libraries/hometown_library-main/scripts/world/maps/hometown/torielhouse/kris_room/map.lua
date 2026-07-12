---@class Map.kris_room : Map
local map, super = Class(Map)

function map:init(world, data)
    super.init(self, world, data)
end

function map:onEnter()
    Game.world.music:play("snore", .5, 0.5)
    Game.world.player:addFX(PaletteFX("party/kris/light/palette", 1))
    if Game.world:getCharacter("susie") then
        Game.world:getCharacter("susie"):addFX(PaletteFX("party/susie/light/palette", 1))
    end
    super.onEnter(self)
end

return map