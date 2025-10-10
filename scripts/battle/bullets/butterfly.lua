local Butterfly, super = Class(Bullet)

function Butterfly:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/spr_butterfly_bullet2/spr_butterfly_bullet2")

    self.name = "butterfly"

    -- Play the sprite's animation
    self.sprite:play(0.2, true)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    -- Whether the butterfly should be following the player
    self.on = false

    -- Set its scale to 1
    self:setScale(1)

    -- Make sure the bullet isn't destroyed on hit
    self.destroy_on_hit = false

    -- Get the first attacker(enemy)
    local attacker = Game.battle.waves[1]:getAttackers()[1]

    -- Get the attacker's position
    self.attackerX, self.attackerY = attacker:getRelativePos(attacker.width/2, attacker.height/2-5)

    -- Make the bullet turn on after 0.1 seconds
    Game.stage.timer:after(0.1, function ()
        self.on = true
    end)

    -- After 3 seconds
    Game.stage.timer:after(3, function ()
        -- Turn the bullet off
        self.on = false

        -- Change its direction towards the attacker
        self.physics.direction = Utils.angle(self.x, self.y, self.attackerX, self.attackerY)

        -- Make it not collidable
        self.collidable = false

        -- Change its speed to 10
        self.physics.speed = 10
    end)

    -- Make sure the bullet is removed when off screen
    self.remove_offscreen = true

    self:setLayer(BATTLE_LAYERS["top"])
end

function Butterfly:update()
    -- For more complicated bullet behaviours, code here gets called every update

    if self.on and Game.battle.soul then

        -- Get the angle between the bullet and the soul
        local aim = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)

        -- Make the bullet's direction approach(smoothly follow) the angle between the bullet and the soul
        self.physics.direction = Utils.approachAngle(self.physics.direction, aim, math.rad(4))

        -- Get the angle again
        aim = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)

        -- Set the speed for a smoother effect
        self.physics.speed = 6 + Utils.angleDiff(self.physics.direction, aim) * 0.7
    end

    -- Make the bullet visually rotate in the direction its moving
    self.rotation = self.physics.direction

    -- If the bullet reaches the attacker
    if self.x >= self.attackerX then
        -- Remove the bullet
        self:remove()
    end

    super.update(self)
end

--[[function Butterfly:onCollide(soul)
    if soul.inv_timer == 0 then
        self:onDamage(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end]]--

return Butterfly