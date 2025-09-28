---@class Battle : Battle
local Battle, super = Class("Battle")

function Battle:checkSolidCollision(collider)
    if NOCLIP then return false end
    Object.startCache()
    for _,arena in ipairs(Game.stage:getObjects(Arena)) do
        if arena:collidesWith(collider) then
            Object.endCache()
            return true, arena
        end
    end
    for _,solid in ipairs(Game.stage:getObjects(Solid)) do
        if solid:collidesWith(collider) then
            Object.endCache()
            return true, solid
        end
    end
    Object.endCache()
    return false
end

function Battle:isBleeding()
    return (self.soul and self.soul["bleeding"])
end

return Battle