local Knife, super = Class(Bullet)

function Knife:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/omknife")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.destroy_on_hit = false
end

function Knife:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

--[[function Knife:onCollide(soul)
    if soul.inv_timer == 0 then
        self:onDamage(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end]]--

return Knife