---@class Actor.susie_lw : Actor
local actor, super = Class("susie_lw", true)

function actor:init()
    super.init(self)
    self.default = "walk"
end

function actor:getDefault()
    if not (Game and Game.world and Game.world.map and Game.world.map.id) then
        return super.getDefault(self)
    end
    if Utils.startsWith(Game.world.map.id, "gateway/") then
        if Mod.shared_gonerbg and Mod.shared_gonerbg.saturation > 0 then
            return "walk_stressed"
        end
        return "walk_unhappy"
    end
    return super.getDefault(self)
end

return actor