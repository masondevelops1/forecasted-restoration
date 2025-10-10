---@class Actor.kris_depths : Actor
local actor, super = Class(modRequire("scripts.data.actors.kris"))

function actor:init()
    super.init(self)
    self.path = "party/kris/dark"
end
local function h(hex)
    return {tonumber(string.sub(hex, 2, 3), 16)/255, tonumber(string.sub(hex, 4, 5), 16)/255, tonumber(string.sub(hex, 6, 7), 16)/255, 1}
end
function actor:onSpriteInit(sprite)
    sprite:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ffb162")))
    sprite:addFX(PaletteFX("party/kris/dark/palette", 1))
end

return actor