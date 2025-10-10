---@class WorldBullet.fireball : WorldBullet
local Fireball, super = Class(WorldBullet)

function Fireball:init(x,y)
    super.init(self,x,y,"bullets/world/fire_1")
    self:addFX(OutlineFX(COLORS.black))
    self.sprite:setAnimation({"bullets/world/fire", 0.1, true})
    self.lifetime = .5
    self.physics.speed = 10
    self.physics.direction = math.pi/2
    self.damage = 3
    self.battle_fade = false
end

function Fireball:update()
    self.lifetime = self.lifetime - DT
    if self.lifetime <= 0 then
        self.lifetime = math.huge
        self:fadeOutAndRemove(0.5)
    end
    super.update(self)
end

function Fireball:getDrawColor()
    local r, g, b, a = super.getDrawColor(self)
    return r, g, b, a * Utils.clampMap(self.world.battle_alpha, 0,1,0.2,1)
end

function Fireball:onCollide(soul)
    if self.alpha < 1 then return end
    return super.onCollide(self,soul)
end

return Fireball