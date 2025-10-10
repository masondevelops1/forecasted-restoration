---@class Wave.scrapscallion.mechpress : Wave
local Basic, super = Class(Wave)

function Basic:onStart()
    -- Every 0.33 seconds...



    self.top_press = self:spawnBulletTo(Game.battle.arena.mask, "scrapscallion/mechpress", 71, 0 + 10)
    self.top_press:slideTo(71, 71-15, self.time)
    self.top_press.sprite.flip_x = false
    self.timer:script(function(wait)
        self:script(wait)
    end)

    local x,y = Game.battle.arena:getBottomLeft()
    local boiler = self:spawnBullet("scrapscallion/boiler", x + 40, y + 20)
    boiler.ember_timer = 0.4
end

function Basic:script(wait)
    local left = false
    while true do
        left = not left
        -- Our X position is offscreen, to the right
        local x = left and Game.battle.arena:getLeft() or Game.battle.arena:getRight()
        -- Get a random Y position between the top and the bottom of the arena
        local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/omnis/darkbullet.lua)
        local bullet = self:spawnBulletTo(Game.battle.mask, "scrapscallion/shrapnel", x, y, math.rad(180), left and -4 or 4)

        Assets.playSound("noise")
        wait(Utils.clampMap(self.top_press.y, 71*2, 71+30, 0.5774, 0.15) * 1.5)
    end
end

function Basic:update()
    -- Code here gets called every frame

    if self.opened then
        self.opened = false
        boiler.fire.speed = -0.1
    end

    super.update(self)
end

return Basic