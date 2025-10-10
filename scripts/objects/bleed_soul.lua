local BleedSoul, super = Class(Soul)

function BleedSoul:init(x, y)
    super:init(self, x, y)

    self.x = x
    self.y = y

    self.timer = 0

    -- Temporarely here, move these to the wave later
    self.bleeding = true

    self.bleed_time = 5
end

function BleedSoul:update()
    super:update(self)
    if not self.bleeding then
        self.sprite:setSprite("player/heart_dodge")
        self:setColor(1, 0, 0)
    else
        self.sprite:setSprite("player/heart_bleed")
        self:setColor(130/255, 0, 0)
    end

    if self.bleed_time <= 0 then
        self.bleed_time = 0
        self.bleeding = false
    end
end

return BleedSoul
