local ExplodeHead, super = Class(Bullet)

function ExplodeHead:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/spr_strangeman_floathead/spr_strangeman_floathead")

    self.sprite:play(1/12, true)

    self.name = "explode_head"

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    -- The amount of butterflies spawned
    self.butterflies = love.math.random(2, 3)

    -- The angle which is used to angle the butterflies, multiplied and changed a bit depending on the number and which one is spawned
    self.angle = 360/self.butterflies

    -- Make the bullet stay after you hit it
    self.destroy_on_hit = false

    -- Set the bullet's origin to 0.5(the bullet's center)
    self:setOrigin(0.5)

    -- Changes the speed to 0 over 2.5 seconds with the method of "out-quad"(easing)
    Game.stage.timer:tween(2.5, self.physics, {speed = 0}, "out-quad")

    -- This will be used to make something happen once in update
    self.once = true

    -- A table of the random directions the butterflies spawn in, to be used by the attack indicators and butterflies
    self.randoms = {}

    -- The initial scale of the bullet
    self:setScale(0)

    -- Changes the bullet's scale from 0 to 2 over 1 second(used for the growing effect)
    Game.stage.timer:tween(1, self, {scale_x=2, scale_y=2})

    self:setLayer(BATTLE_LAYERS["top"])
end

function ExplodeHead:update()
    -- For more complicated bullet behaviours, code here gets called every update

    -- Makes the bullet head towards the arena's center
    self.physics.direction = Utils.angle(self.x, self.y, Game.battle.arena.right-Game.battle.arena.width/2, Game.battle.arena.bottom-Game.battle.arena.height/2)

    -- Once the bullet has reached the speed of 1(when it at the center of the arena), this will happen once
    if self.physics.speed <= 1 and self.once then
        -- Set once to false to ensure this doesn't happen again
        self.once = false

        -- Set the bullet's sprite's animation to the explosion animation
        self.sprite:setAnimation({"bullets/spr_strangeman_floathead/everymanexplode", 0.05, false})

        -- Move the sprites position to offset the animation correctly
        self.sprite.x = self.sprite.x - 6
        self.sprite.y = self.sprite.y - 6

        -- Loop this code the amount of butterflies that will spawn
        for i = 1, self.butterflies do
            -- Get a random angle from 0 to 359(360 is the same as 0)
            local rand = love.math.random(0, 359)

            -- Insert the random value into the randoms table
            table.insert(self.randoms, rand)

            -- Get the indicator
            local indicator = attack_indicator()

            -- Set its x and y to the bullet's x and y
            indicator.x, indicator.y = self.x, self.y

            -- Rotate it to the random rotation decided earlier
            indicator.sprite.rotation = math.rad(self.angle*i+rand)

            -- Add the indicator to the wave
            Game.battle.waves[1]:addChild(indicator)
        end

        -- After 0.3 seconds
        Game.stage.timer:after(0.3, function ()
            -- Remove the bullet from the wave
            self:remove()

            -- Play the "bomb" sound
            Assets.playSound("bomb")

            -- Once again loop this code the amount of butterflies that will spawn
            for i = 1, self.butterflies do
                -- Spawn a butterfly at the bullet's positiion, with the rotation of self.angle*the current bullet's number+the random angle, honestly this whole calculation is unecessary and can be replaced by just "self.randoms[i]" but I'm too lazy lmao, also the speed of the bullet is 6
                Game.battle.waves[1]:spawnBullet("butterfly", self.x, self.y, math.rad(self.angle*i+self.randoms[i]), 6)
            end
        end)
    end

    super.update(self)
end

--[[function ExplodeHead:onCollide(soul)
    if soul.inv_timer == 0 then
        self:onDamage(soul)
    end

    if self.destroy_on_hit then
        self:remove()
    end
end]]--

return ExplodeHead