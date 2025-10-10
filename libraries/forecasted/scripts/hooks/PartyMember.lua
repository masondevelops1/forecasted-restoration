---@class PartyMember : PartyMember
local PartyMember, super = Class(PartyMember)

function PartyMember:setDepthsActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    self.depths_actor = actor
end

-- TODO: rename to be lore accurate
function PartyMember:setDuskActor(actor)
    if type(actor) == "string" then
        actor = Registry.createActor(actor)
    end
    self.dusk_actor = actor
end

function PartyMember:getActor(light)
    if light == nil then
        light = Game.light
    end
    if light and self.lw_actor then
        return self.lw_actor
    elseif Kristal.callEvent("isDepths") and self.depths_actor then
        return self.depths_actor
    elseif Kristal.callEvent("isDusk") and self.dusk_actor then
        return self.dusk_actor
    else
        return self.actor
    end
end

return PartyMember