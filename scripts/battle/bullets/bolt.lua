local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/bolt")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.layer = BATTLE_LAYERS["top"]

    self:setScale(1)

    self.tp = 0

    self.remove_offscreen = true
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    self.physics.speed = self.physics.speed + DTMULT/3

    for _,arena in ipairs(Game.stage:getObjects(Arena)) do
        if arena:collidesWith(self.collider) then
            self:remove()
        end
    end


    if Game.battle.waves[1].divider.collider:collidesWith(self.collider) then
        self:remove()
    end

    super.update(self)
end

--[[function SmallBullet:onCollide(soul)
    if soul.inv_timer == 0 then
        self:onDamage(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end]]--

return SmallBullet