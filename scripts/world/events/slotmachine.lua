---@class Event.slotmachine : Interactable
local event, super = Class(Interactable, "slotmachine")

local function uglyCompatibilityHack(data)
    -- It's amazing that lua lets you do this. That being said, never do this...
    local params = debug.getinfo(Interactable.init, "u").nparams
    if params == 5 then
        return data.x, data.y, {data.width, data.height}, data.properties
    else
        return data.x, data.y, data.width, data.height, data.properties
    end
end

function event:init(data)
    super.init(self, uglyCompatibilityHack(data))
    self.cutscene = "boatCutscenes.gambling"
    self:setSprite("objects/boat/slotmachine/slotmachine")
    self.sprite.path = "objects/boat/slotmachine"
    self:setHitbox(0,self.height-40,self.width,40)
    self.solid = true
end

function event:loser()
    self.sprite:setAnimation({"slotSpinLose", 0.1, false})
    return function () return self.sprite.frame == 10 end
end

function event:winner()
    self.sprite:setAnimation({"slotSpinWin", 0.1, false})
    return function () return self.sprite.frame == 15 end
end

-- Just so we can place the object nicely in Tiled.
function event:applyTileObject(data, map)
    local origin = Tileset.ORIGINS[map:getTileset(data.gid).object_alignment] or Tileset.ORIGINS["unspecified"]
    self:setOrigin(origin[1], origin[2])
end

return event