local RainBullet, super = Class(Bullet)

function RainBullet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/raindrop")
	self:setOrigin()
	self:setHitbox(11, 3, 8, 2)
end

function RainBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return RainBullet