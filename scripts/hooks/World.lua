---@class World : World
local World, super = Class(World)

function World:showHealthBars()
    if self.healthbar then
        self.healthbar:transitionIn()
    else
        self.healthbar = HealthBar()
        self.healthbar.layer = WORLD_LAYERS["ui"]
        self:addChild(self.healthbar)
    end
end

function World:sortChildren()
    Utils.pushPerformance("World#sortChildren")
    Object.startCache()
    local positions = {}
    for _,child in ipairs(self.children) do
        local x, y = child:getSortPosition()
        positions[child] = {x = x, y = y}
    end
    table.stable_sort(self.children, function(a, b)
        -- I hate this hack so much but it works
        if a.data and a.data.properties and a.data.properties.sortlink then
            a = self.map:getEvent(a.data.properties.sortlink.id) or a
        end
        if b.data and b.data.properties and b.data.properties.sortlink then
            b = self.map:getEvent(b.data.properties.sortlink.id) or b
        end
        local a_pos, b_pos = positions[a], positions[b]
        local ax, ay = a_pos.x, a_pos.y
        local bx, by = b_pos.x, b_pos.y
        if a.layer == b.layer then
            if a:includes(AdvancedGonerBackground) and not b:includes(AdvancedGonerBackground) then
                return true
            end
            if b:includes(AdvancedGonerBackground) and not a:includes(AdvancedGonerBackground) then
                return false
            end
        end
        -- Sort children by Y position, or by follower index if it's a follower/player (so the player is always on top)
        return a.layer < b.layer or
              (a.layer == b.layer and (math.floor(ay) < math.floor(by) or
              (math.floor(ay) == math.floor(by) and (b == self.player or
              (a:includes(Follower) and b:includes(Follower) and b.index < a.index)))))
    end)
    Object.endCache()
    Utils.popPerformance()
end

return World