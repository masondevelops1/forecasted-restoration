---@class WorldBullet.smallbullet : WorldBullet
local SmallBullet, super = Class(WorldBullet)

function SmallBullet:init(x,y)
    super.init(self,x,y,"bullets/smallbullet")
    self.lifetime = 6
    self.physics.speed = 10
    self.physics.direction = math.pi/2
    self:setScale(4)
    self.damage = 3
    self.battle_fade = false
end

function SmallBullet:update()
    self.lifetime = self.lifetime - DT
    if self.lifetime <= 0 then
        self.lifetime = math.huge
        self:fadeOutAndRemove(0.5)
    end
    super.update(self)
end

function SmallBullet:getDrawColor()
    local r, g, b, a = super.getDrawColor(self)
    return r, g, b, a * Utils.clampMap(self.world.battle_alpha, 0,1,0.2,1)
end

function SmallBullet:onCollide(soul)
    if self.alpha < 1 then return end
    return super.onCollide(self,soul)
end

return SmallBullet