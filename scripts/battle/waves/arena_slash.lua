local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)

    -- Set up variables for later
    self.sliced = false
    self.darksliced = false
    self.counter = 0

    -- Make the wave have a time of 16.6 seconds
    self.time = 16.6

    -- Set the arena and the soul's positions
    self:setArenaPosition(316, 166)
    self:setSoulPosition(316, 166)

    -- Set up some objects(The arena halves, the masks for the arenas, and the divider that deletes the bolt bullets)
    self.half_top = Arena(1000, 1000, {{0, 0}, {133, 0}, {0, 133}})
    self.half_bottom = Arena(1000, 1000, {{133, 133}, {133, 0}, {0, 133}})

    self.half_top.layer = BATTLE_LAYERS["arena"]
    self.half_bottom.layer = BATTLE_LAYERS["arena"]

    Game.battle:addChild(self.half_top)
    Game.battle:addChild(self.half_bottom)

    self.mask_top = ArenaMask(BATTLE_LAYERS["top"], 0, 0, self.half_top) --ArenaMask(layer, x, y, arena)
    self.mask_bottom = ArenaMask(BATTLE_LAYERS["top"], 0, 0, self.half_bottom) --ArenaMask(layer, x, y, arena)
    
    self:addChild(self.mask_top)
    self:addChild(self.mask_bottom)

    self.divider = ArenaDivider()
    self.divider.rotation = math.rad(-135)
    self.divider.x, self.divider.y = 246, 238

    self:addChild(self.divider)
end

function Basic:onStart()

    -- HOLY SHIT ITS THE DARK SOUL
    Game.battle:swapSoul(DarkSoul())

    -- Get all enemies that selected this wave as their attack
    local attackers = self:getAttackers()

    -- Loop through all attackers
    for _, attacker in ipairs(attackers) do

        -- Get the attacker's center position
        self.knifeX, self.knifeY = attacker:getRelativePos(attacker.width/2, attacker.height/2)

        -- Set Omnis to the throwing animation and play the sound
        attacker:setAnimation("battle/throw")
        Assets.playSound("swing")

        -- After 0.8 seconds...
        self.timer:after(0.8, function ()
            -- Spawn the knife and make it fly up diagonally above the arena
            Assets.playSound("slice")
            self.knife = self:spawnBullet("knife", self.knifeX-60, self.knifeY-45, 0, 0)

            self.timer:tween(1, self.knife, {x=440}, "in-quad")
            self.timer:tween(1, self.knife, {y=45}, "out-back")
            self.timer:tween(1, self.knife, {rotation=math.rad(360+150)})
        end)
    end

    self.timer:after(1.8, function ()
        -- Set the knife's rotation to be correct
        self.knife.rotation = math.rad(150)

        -- Make the knife slice the arena
        Assets.playSound("swing")
        Assets.playSound("appear")
        self.timer:tween(0.5, self.knife, {x=205,y=280}, "in-back")

        -- After 0.35 seconds...
        self.timer:after(0.35, function ()
            -- Spawn the slice darkness particles
            for i = 1, 20 do
                self:spawnBulletTo(nil, "darkbullet_inactive", 316, 166, math.rad(love.math.random(160, 300)), love.math.random(3, 6))
                self:spawnBulletTo(nil, "darkbullet_inactive", 316, 166, math.rad(love.math.random(100, -50)), love.math.random(3, 6))
            end

            -- After 0.2 seconds...
            self.timer:after(0.2, function ()
                -- Make the sliced variable become true(used to spawn the darkness blobs)
                self.sliced = true
            end)

            -- Move the arena shards to the correct positions
            self.half_top:setPosition(311, 161)
            self.half_bottom:setPosition(320, 170)

            -- Put the arena below the background(temporary solution)
            Game.battle.arena.layer = BATTLE_LAYERS["bottom"]
        end)

        -- After 0.5 seconds...
        self.timer:after(0.5, function ()
            -- Move the knife back towards Omnis
            self.timer:tween(1, self.knife, {x=self.knifeX-60}, "out-quad")
            self.timer:tween(1, self.knife, {y=self.knifeY-15}, "in-quad")
            self.timer:tween(1, self.knife, {rotation=math.rad(360+150)})

            -- Make Omnis catch the knife
            self.timer:after(0.7, function ()
                Assets.playSound("swing")
                attackers[1]:setAnimation("battle/catch")
            end)

            -- After 1 seconds...
            self.timer:after(1, function ()
                -- Remove it
                self.knife:remove()
            end)
        end)
    end)

    -- Every 1/25 seconds...
    self.timer:every(1/25, function ()
        -- If the arena has been sliced
        if self.sliced then
            -- Spawn the darkness blobs and put them in the respective masks
            local bullet = self:spawnBulletTo(self.mask_top, "darkbullet", 320, 170, math.rad(love.math.random(200, 250)), Utils.pick({4, 5}))
            bullet.outline:setParent(self.mask_top)
            bullet = self:spawnBulletTo(self.mask_bottom, "darkbullet", 311, 161, math.rad(love.math.random(30, 60)), Utils.pick({4, 5}))
            bullet.outline:setParent(self.mask_bottom)

            --self:spawnBulletTo(nil, "darkbullet", 316, 166, math.rad(love.math.random(1, 360)), 2)
        end
        
    end)

    --[[self.timer:every(1/200, function ()
        if self.darksliced then
            local x = love.math.random(245, 387)
            local y = -x + (332 + 150)
            local bullet = self:spawnBulletTo(nil, "darkslash", x, y, math.rad(love.math.random(1, 360)), 1)
            bullet.startScale = 2
            self.timer:after(1/500, function ()
                bullet.speed = 15
            end)
        end
    end)]]--

    -- Set up a variable that goes back and forth between true and false, used to alternate between the knife locations
    local switch = false

    -- Every 4 seconds...
    self.timer:every(4, function() 
        -- Get a randomized angle
        local angle = love.math.random() * 2 * math.pi

        -- Get the bullet's position on a circle with a radius of 250 around the center of the arena
        local x = 250 * math.sin( angle ) + Game.battle.arena.x
        local y = 250 * math.cos( angle ) + Game.battle.arena.y

        -- Get the angle between the position and the center of the arena
        local dir = Utils.angle(x, y, Game.battle.arena.x, Game.battle.arena.y)

        -- Spawn the bullet
        local bullet = self:spawnBullet("explodehead", x, y, dir, 8)
        bullet:setLayer(BATTLE_LAYERS["top"])
    end)

    -- Every 3 seconds...
    self.timer:every(3, function ()
        -- If the arena has been sliced
        if self.sliced then
            -- If switch is false
            if not switch then
                -- Spawn the knife and fade it in
                local knife = self:spawnBulletTo(nil, "handknife", 290, 40, math.rad(0), 0)
                self.timer:tween(0.5, knife, {alpha=1})
                Assets.playSound("appear")

                -- After 0.5 seconds...
                self.timer:after(0.5, function ()
                    -- Make the knife stab into the arena
                    self.timer:tween(0.5, knife, {y=90}, "in-back")

                    -- After 0.5 seconds...
                    self.timer:after(0.5, function ()
                        -- Play the impact sound
                        Assets.playSound("impact")

                        -- After 0.2 seconds...
                        self.timer:after(0.2, function ()
                            -- Play the electric sound
                            Assets.playSound("electric")
                        end)

                        -- Shake the knife
                        knife:shake(3, 3, 0.1)

                        -- Script that lets you use "wait"
                        self.timer:script(function(wait)
                            -- Execute 5 times
                            for f=1, 5 do
                                -- Wait 2 seconds
                                wait(0.2)

                                -- Execute 11 times
                                for i=1, 11 do
                                    -- If the batch of bolts is even
                                    if f % 2 == 0 then
                                        self.addition = 10

                                    -- If the batch of bolts is odd
                                    else
                                        self.addition = 20
                                    end

                                    -- Spawn a bolt with an angle related to the batch number(as seen in the above if statement) and the bolt number
                                    local bolt = self:spawnBulletTo(self.mask_top, "bolt", 290, 100, math.rad(-70+20*i+self.addition), 1)
                                    bolt.rotation = math.rad(bolt.physics.direction+180)
                                end
                            end
                        end)

                        -- After 1 seconds...
                        self.timer:after(1, function ()
                            -- Send the knife back up and fade it out
                            self.timer:tween(0.5, knife, {y=40}, "out-quad")
                            self.timer:tween(0.5, knife, {alpha=0})
                            self.timer:after(0.5, function ()
                                knife:remove()
                            end)
                        end)
                    end)
                end)
            -- If switch is true
            else
                -- Spawn the knife and fade it in
                local knife = self:spawnBulletTo(nil, "handknife", 340, 290, math.rad(180), 0)
                knife.rotation = math.rad(180)
                self.timer:tween(0.5, knife, {alpha=1})
                Assets.playSound("appear")

                -- After 0.5 seconds...
                self.timer:after(0.5, function ()
                    -- Make the knife stab into the arena
                    self.timer:tween(0.5, knife, {y=240}, "in-back")

                    -- After 0.5 seconds...
                    self.timer:after(0.5, function ()
                       -- Play the impact sound
                        Assets.playSound("impact")

                        -- After 0.2 seconds...
                        self.timer:after(0.2, function ()
                            -- Play the electric sound
                            Assets.playSound("electric")
                        end)

                        -- Shake the knife
                        knife:shake(3, 3, 0.1)

                        -- Script that lets you use "wait"
                        self.timer:script(function(wait)
                            -- Execute 5 times
                            for f=1, 5 do
                                -- Wait 2 seconds
                                wait(0.2)

                                -- Execute 10 times
                                for i=1, 10 do
                                    -- If the batch of bolts is even
                                    if f % 2 == 0 then
                                        self.addition = 10

                                    -- If the batch of bolts is odd
                                    else
                                        self.addition = 20
                                    end

                                    -- Spawn a bolt with an angle related to the batch number(as seen in the above if statement) and the bolt number
                                    local bolt = self:spawnBulletTo(self.mask_bottom, "bolt", 340, 230, math.rad(140+20*i+self.addition), 1)
                                    bolt.rotation = math.rad(bolt.physics.direction+180)
                                end
                            end
                        end)

                        -- After 1 seconds...
                        self.timer:after(1, function ()
                            -- Send the knife back up and fade it out
                            self.timer:tween(0.5, knife, {y=290}, "out-quad")
                            self.timer:tween(0.5, knife, {alpha=0})
                            self.timer:after(0.5, function ()
                                knife:remove()
                            end)
                        end)
                    end)
                end)
            end

            -- add one to the counter
            self.counter = self.counter + 1

            -- Flip the switch
            switch = not switch

            -- if counter is 5
            if self.counter == 5 then
                if not switch then
                    -- Spawn the knife and fade it in
                    local knife = self:spawnBulletTo(nil, "handknife", 290, 40, math.rad(0), 0)
                    self.timer:tween(0.5, knife, {alpha=1})
                    Assets.playSound("appear")
    
                    -- After 0.5 seconds...
                    self.timer:after(0.5, function ()
                        -- Make the knife stab into the arena
                        self.timer:tween(0.5, knife, {y=90}, "in-back")
    
                        -- After 0.5 seconds...
                        self.timer:after(0.5, function ()
                            -- Play the impact sound
                            Assets.playSound("impact")
    
                            -- After 0.2 seconds...
                            self.timer:after(0.2, function ()
                                -- Play the electric sound
                                Assets.playSound("electric")
                            end)
    
                            -- Shake the knife
                            knife:shake(3, 3, 0.1)
    
                            -- Script that lets you use "wait"
                            self.timer:script(function(wait)
                                -- Execute 5 times
                                for f=1, 5 do
                                    -- Wait 2 seconds
                                    wait(0.2)
    
                                    -- Execute 11 times
                                    for i=1, 11 do
                                        -- If the batch of bolts is even
                                        if f % 2 == 0 then
                                            self.addition = 10
    
                                        -- If the batch of bolts is odd
                                        else
                                            self.addition = 20
                                        end
    
                                        -- Spawn a bolt with an angle related to the batch number(as seen in the above if statement) and the bolt number
                                        local bolt = self:spawnBulletTo(self.mask_top, "bolt", 290, 100, math.rad(-70+20*i+self.addition), 1)
                                        bolt.rotation = math.rad(bolt.physics.direction+180)
                                    end
                                end
                            end)
    
                            -- After 1 seconds...
                            self.timer:after(1, function ()
                                -- Send the knife back up and fade it out
                                self.timer:tween(0.5, knife, {y=40}, "out-quad")
                                self.timer:tween(0.5, knife, {alpha=0})
                                self.timer:after(0.5, function ()
                                    knife:remove()
                                end)
                            end)
                        end)
                    end)
                -- If switch is true
                else
                    -- Spawn the knife and fade it in
                    local knife = self:spawnBulletTo(nil, "handknife", 340, 290, math.rad(180), 0)
                    knife.rotation = math.rad(180)
                    self.timer:tween(0.5, knife, {alpha=1})
                    Assets.playSound("appear")
    
                    -- After 0.5 seconds...
                    self.timer:after(0.5, function ()
                        -- Make the knife stab into the arena
                        self.timer:tween(0.5, knife, {y=240}, "in-back")
    
                        -- After 0.5 seconds...
                        self.timer:after(0.5, function ()
                           -- Play the impact sound
                            Assets.playSound("impact")
    
                            -- After 0.2 seconds...
                            self.timer:after(0.2, function ()
                                -- Play the electric sound
                                Assets.playSound("electric")
                            end)
    
                            -- Shake the knife
                            knife:shake(3, 3, 0.1)
    
                            -- Script that lets you use "wait"
                            self.timer:script(function(wait)
                                -- Execute 5 times
                                for f=1, 5 do
                                    -- Wait 2 seconds
                                    wait(0.2)
    
                                    -- Execute 10 times
                                    for i=1, 10 do
                                        -- If the batch of bolts is even
                                        if f % 2 == 0 then
                                            self.addition = 10
    
                                        -- If the batch of bolts is odd
                                        else
                                            self.addition = 20
                                        end
    
                                        -- Spawn a bolt with an angle related to the batch number(as seen in the above if statement) and the bolt number
                                        local bolt = self:spawnBulletTo(self.mask_bottom, "bolt", 340, 230, math.rad(140+20*i+self.addition), 1)
                                        bolt.rotation = math.rad(bolt.physics.direction+180)
                                    end
                                end
                            end)
    
                            -- After 1 seconds...
                            self.timer:after(1, function ()
                                -- Send the knife back up and fade it out
                                self.timer:tween(0.5, knife, {y=290}, "out-quad")
                                self.timer:tween(0.5, knife, {alpha=0})
                                self.timer:after(0.5, function ()
                                    knife:remove()
                                end)
                            end)
                        end)
                    end)
                end
            end
        end
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

function Basic:onEnd()
    -- Remove the masks and arena shards
    self:removeChild(self.mask_top)
    self:removeChild(self.mask_bottom)
    Game.battle:removeChild(self.half_top)
    Game.battle:removeChild(self.half_bottom)
end

return Basic