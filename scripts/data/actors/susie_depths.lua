---@class Actor.susie_depths : Actor
-- I hate this so much but it's needed so that the custom offsets apply
local actor, super = Class(modRequire("scripts.data.actors.susie"))

function actor:init()
    super.init(self)
    self.path = "party/susie/dark"
end

local function h(hex)
    return {tonumber(string.sub(hex, 2, 3), 16)/255, tonumber(string.sub(hex, 4, 5), 16)/255, tonumber(string.sub(hex, 6, 7), 16)/255, 1}
end

---@param sprite ActorSprite
function actor:onSpriteInit(sprite)
    sprite:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ffb162")))
    -- As an alternative to editing the sprites, we add a PaletteFX. This won't work for Ch7.
    sprite:addFX(PaletteFX("party/susie/depths/palette", 1, nil),nil)
end


return actor