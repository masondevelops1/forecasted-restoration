---@class Bullet.scrapscallion.anvil : Bullet
local anvil, super = Class(Bullet)

function anvil:init(x, y, dir, speed)
    super.init(self, x, y, "bullets/scrapscallion/anvil")
    self.destroy_on_hit = false

    self:setOrigin(0.5, 1)

    self.physics.speed = speed
    self.physics.direction = dir

    self:setScale(1)

    self:setHitbox(10, 0, self.width-20, self.height)

    self.threshold = Game.battle.arena:getBottom()+10

    self.topSpeed = 14

    Game.battle.waves[1].timer:after(0.1, function ()
        Game.battle.waves[1].timer:tween(1, self.physics, {speed_y = self.topSpeed}, "in-quad")
    end)
end

function anvil:update()
    super.update(self)

    if self.y >= self.threshold then
        Assets.playSound("anvil")
        Game.battle.waves[1].shakePress = true
        local sharda = Game.battle.waves[1]:spawnBullet("scrapscallion/anvilshard", self.x-20, self.y-self.width/2-20, 0, 0)
        local shardb = Game.battle.waves[1]:spawnBullet("scrapscallion/anvilshard", self.x-10, self.y-self.width/2-5, 0, 0)
        local shardc = Game.battle.waves[1]:spawnBullet("scrapscallion/anvilshard", self.x+12, self.y-self.width/2-5, 0, 0)
        local shardd = Game.battle.waves[1]:spawnBullet("scrapscallion/anvilshard", self.x, self.y-self.width/2-2, 0, 0)
        local sharde = Game.battle.waves[1]:spawnBullet("scrapscallion/anvilshard", self.x, self.y-self.width/2-2, 0, 0)
        sharda.piece = "a"
        shardb.piece = "b"
        shardc.piece = "c"
        shardd.piece = "d"
        sharde.piece = "e"
        sharda.physics.speed_x = -4
        shardb.physics.speed_x = -5
        shardc.physics.speed_x = 4
        shardd.physics.speed_x = -4
        sharde.physics.speed_x = 4.5
        sharda.physics.speed_y = -14
        shardb.physics.speed_y = -14
        shardc.physics.speed_y = -14
        shardd.physics.speed_y = -14
        sharde.physics.speed_y = -14
        self:remove()
    end
end

return anvil