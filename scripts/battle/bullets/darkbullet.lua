local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/omnis/darkoutline")

    self.name = "darkbullet"

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.rotateAmount = math.rad(love.math.random(3, -3))

    self.slowdown = love.math.random(0.3, 0.35)

    self:setScale(love.math.random(0.5, 1))

    self.grow = true

    self.outline = Sprite("bullets/omnis/darkbullet", self.x, self.y)
    self.outline:setOrigin(0.5)
    Game.battle.waves[1]:addChild(self.outline)
    self.outline.layer = BATTLE_LAYERS["above_bullets"]
    self:setLayer(BATTLE_LAYERS["bullets"])

    self.destroy_on_hit = false

    self.damage = 0

    self.tp = 0

    self.speed = 5

    Game.battle.waves[1].timer:every(1/100, function ()
        self.outline:setPosition(self.x, self.y)
        self.outline:setScale(self.scale_x)
        self.outline.rotation = self.rotation
    end)
    self.grazed = true
end

function SmallBullet:getGrazeTension()
    return 0
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    self.rotation = self.rotation + self.rotateAmount*DTMULT

    self.physics.speed = self.physics.speed - self.slowdown

    if self.grow then
        self.scale_x, self.scale_y = self.scale_x + DTMULT/10, self.scale_y + DTMULT/10
    else
        self.scale_x, self.scale_y = self.scale_x - DTMULT/self.speed, self.scale_y - DTMULT/self.speed
    end

    if self.scale_x <= 0 then
        self:remove()
        self.outline:remove()
    end

    if self.physics.speed <= 0 then
        self.physics.speed = 0
        self.grow = false
    end

    super.update(self)
end

---@param soul DarknessSoul
function SmallBullet:onCollide(soul)
    soul:setBleeding(true)

    if soul.inv_timer == 0 then
        self:onDamage(soul)
    end
    
    if self.destroy_on_hit then
        self:remove()
    end
end

return SmallBullet