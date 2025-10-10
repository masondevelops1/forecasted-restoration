local BleedAttack1, super = Class(Wave)

function BleedAttack1:init()
    super.init(self)
    -- The time the wave runs for(in seconds I think)
    self.time = -1
    self.angle = 0
end

function BleedAttack1:onStart()

    self.spark = bleed_spark()

    Game.battle.waves[1]:addChild(self.spark)
    self.spark:setScale(0)

    self.timer:every(8, function ()

        self.spark.x = love.math.random(Game.battle.arena.left+10, Game.battle.arena.right-10)
        self.spark.y = -10

        self.timer:tween(1, self.spark, {scale_x=1,scale_y=1}, "out-quad")
        self.spark:slideTo(self.spark.x, 170, 1, "out-quad")
        Assets.playSound("bell")
        self.timer:after(3, function ()
            self.timer:tween(1, self.spark, {scale_x=0,scale_y=0}, "in-quad")
            self.spark:slideTo(self.spark.x, -10, 1, "in-quad")
            Assets.playSound("awkward")
        end)
    end)

    --[[self.spark.x = love.math.random(Game.battle.arena.left+10, Game.battle.arena.right-10)

    self.spark.y = 480
    self.spark.physics.speed = 8
    self.spark.physics.direction = math.rad(270)]]--

    self.timer:everyInstant(1, function() 

        local r = love.math.random(0, 80)

        for i = 1, 2 do
            if i == 1 then
                local x = r * math.cos(math.rad(180)) + 320
                local y = r * math.sin(math.rad(180)) + 170
                self:spawnBullet("beam", x, y, 0, 0)
            else
                local x = r * math.cos(math.rad(0)) + 320
                local y = r * math.sin(math.rad(0)) + 170
                self:spawnBullet("beam", x, y, 0, 0)
            end
        end
    end)
end

function BleedAttack1:update()
    super.update(self)

    self.angle = self.angle + DTMULT*4

    --self.spark.x = 70 * math.sin(math.rad(self.angle)) + 320
    --self.spark.y = 70 * math.cos(math.rad(self.angle)) + 170

    --[[if self.spark.y >= 500 then
        self.spark.y = 480
        self.spark.physics.speed = 8
        self.spark.physics.direction = math.rad(270)
        self.spark.x = love.math.random(Game.battle.arena.left+10, Game.battle.arena.right-10)
    elseif self.spark.y <= -20 then
        self.spark.y = 0
        self.spark.physics.speed = 8
        self.spark.physics.direction = math.rad(90)
        self.spark.x = love.math.random(Game.battle.arena.left+10, Game.battle.arena.right-10)
    end]]--
end

return BleedAttack1