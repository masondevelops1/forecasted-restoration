local wave, super = Class(Wave)

function wave:init()
    super.init(self)

    self:setArenaSize(150, 200)

    self.spawnTimer = 1.2

    self.time = 12

    self.shakePress = false
end

function wave:onStart()
    ---@type Bullet.scrapscallion.pipe
    self.pipe = --[[@as Bullet.scrapscallion.pipe]] self:spawnBulletTo(Game.battle.arena, "scrapscallion/pipe", Game.battle.arena.width/2, 0)
    self.pipe.delay = 0.75

    self.bottom_press = self:spawnBulletTo(Game.battle.arena.mask, "scrapscallion/mechpress", 71, Game.battle.arena.bottom - 80)
    self.bottom_press:slideTo(71, 120, self.time)
    self.bottom_press.rotation = math.pi
    self.bottom_press.sprite.flip_x = true

    self.timer:script(function (wait)
        while true do
            wait(self.spawnTimer)
            local x,y = love.math.random(Game.battle.arena.left+25, Game.battle.arena.right-25), Game.battle.arena.top
            local bullet = self:spawnBulletTo(Game.battle.mask, "scrapscallion/anvil", x, y, math.pi*1.5, 0)
            bullet.topSpeed = 8
            if self.spawnTimer > 0.8 then
            self.spawnTimer = self.spawnTimer -0.1
            end
            bullet.threshold = self.bottom_press.y+72
        end
    end)
end

function wave:update()
    super.update(self)
    if self.shakePress then
        self.shakePress = false
        self.bottom_press:shake()
    end
end

return wave