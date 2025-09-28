---@class Map.gateway.chase_upward : Map
local map, super = Class(Map)

function map:onEnter()
    -- local gap = 80*2
    -- self.timer:everyInstant(1, function ()
    --     -- local y = select(2, Game.world.camera:getRect())
    --     for y=100,2200,gap do
    --         local bullet = Game.world:spawnBullet("smallbullet", -40, y)
    --         bullet.physics.direction = 0
    --         bullet.lifetime = 2
    --         bullet = Game.world:spawnBullet("smallbullet", SCREEN_WIDTH+40, y+(gap/2))
    --         bullet.physics.direction = math.pi
    --         bullet.lifetime = 2
    --     end
    -- end)
    self.overlay_mask = Game.world.battle_fader:addFX(MaskFX(self:getTileLayer("Tile Layer 1")))
end

function map:onExit()
    Game.world.battle_fader:removeFX(self.overlay_mask)
end

return map