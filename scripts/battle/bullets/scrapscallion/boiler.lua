---@class Bullet.scrapscallion.boiler : Bullet
local bullet, super = Class(Bullet)

function bullet:init(x,y)
    super.init(self, x,y, "bullets/scrapscallion/boiler/opening_1")
    self.sprite.path = "bullets/scrapscallion/boiler"
    self.sprite:setAnimation{"opening", 0.1}
    self.sprite.anim_callback = function (sprite)
        sprite:setAnimation{"fire", 0.2, true}
        if not self.opened then
            self.opened = true
            self:onOpened()
        end
    end
    self.destroy_on_hit = false
    self.remove_offscreen = false
    self:setOrigin(1)
    -- Dimentions of first draft sprite
    if self.width == 93 and self.height == 127 then
        self:setScale(1.5)
    end
    self.timer = self:addChild(Timer())

    self.ember_timer = 0.2

    self.opened = false
end

function bullet:update()
    super.update(self)
    if self.sprite.frame >= 13 and not self.opened then
        self:onOpened()
        self.opened = true
    end
end

function bullet:onOpened()
    Assets.playSound("badexplosion")
    self.opened = true
    local x = 0
    self.timer:every(self.ember_timer, function ()
        local ax, ay = Game.battle.arena:getTopLeft()
        local aw = Game.battle.arena:getScaledWidth()
        x = x + love.math.random(aw * (1/4), aw * (3/4))
        local ember = self.wave:spawnBulletTo(Game.battle.mask, "bullets/scrapscallion/boilerfire/ember", ax + (x % aw), ay - 10)
        ember.physics.speed_y = 4
        ember.physics.speed_x = Utils.pick{-.5,.5}
    end)
    self.fire = self.wave:spawnBulletTo(Game.battle.arena.mask, "scrapscallion.boilerfire", 0, Game.battle.arena.height+20)
end

return bullet