---@class DarknessSoul : Soul
---@overload fun(...): DarknessSoul
local DarkSoul, super = Class(Soul)

function DarkSoul:init(x, y)
    super.init(self, x, y)

    -- HOLY SHIT ITS THE DARK SOUL

    self.x = x
    self.y = y

    self.timer = 0

    -- Temporarely here, move these to the wave later
    self.bleeding = false

    self.colided = false

    self.bleed_time = 0
end

function DarkSoul:update()
    super.update(self)

    if not self.bleeding then
        self:setColor(1, 0, 0)
        self.sprite:setSprite("player/heart_dodge")
        Game.battle.waves[1].half_top.collidable = true
        Game.battle.waves[1].half_bottom.collidable = true
    else
        self:setColor(130/255, 0, 0)
        self.sprite:setSprite("player/heart_bleed")
        Game.battle.waves[1].half_top.collidable = false
        Game.battle.waves[1].half_bottom.collidable = false
        self.bleed_time = self.bleed_time - DT
        if self.bleeding then
            if self.bleed_time <= 0 then
                self:setBleeding(false)
            else
                local bullet = Game.battle.waves[1]:spawnBulletTo(nil, "darkbullet_soul", self.x, self.y, math.rad(love.math.random(0, 359)), Utils.pick({1, 1, 4}))
                bullet:setScale(4)
                bullet.startScale = 4
                bullet.grow = false
            end
        end
    end
end

---@param bleeding boolean
function DarkSoul:setBleeding(bleeding)
    if self.bleeding == bleeding then return end
    self.bleeding = bleeding
    if bleeding then
        self.layer = BATTLE_LAYERS["top"]
        self.bleed_time = .4
    else
        self.bleed_time = 0
        self.layer = BATTLE_LAYERS["soul"]
    end
end

--[[function DarkSoul:onCollide(bullet)
    print(bullet.name)
    if bullet.name == "darkbullet" then
        self.bleeding = true
    end
    bullet:onCollide(self)
end]]--

return DarkSoul
