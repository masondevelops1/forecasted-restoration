local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/scrapscallion/oil_droplet")
    self:setScale(1)
    self:setOrigin(0.5)
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    local prev_x, prev_y = self:getPosition()
    prev_y = prev_y - (3*DTMULT)
    super.update(self)
    if prev_x ~= self.x or prev_y ~= self.y then
        self.rotation = Utils.angle(prev_x, prev_y, self:getPosition()) + math.rad(-90)
    end
end

return SmallBullet