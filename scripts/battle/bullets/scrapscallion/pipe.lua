---@class Bullet.scrapscallion.pipe : Bullet
local bullet, super = Class(Bullet)

function bullet:init(x,y)
    super.init(self, x,y, "bullets/scrapscallion/pipe_1")
    self.delay = 0.5
    self:setHitbox(0,0,self.width,self.height-4)
    self.destroy_on_hit = false
    self:setOrigin(0.5, 0)
    self.sprite:setAnimation({"bullets/scrapscallion/pipe", function (spr, wait)
        wait(1)
        for i = 2, #Assets.getFrames("bullets/scrapscallion/pipe") - 3 do
            spr:setFrame(i)
            Assets.playSound("noise", 0.6, Utils.random(2.5, 3.5))
            wait(0.05)
            Assets.playSound("noise", 0.6, Utils.random(2.5, 3.5))
            wait(0.05)
        end

        Assets.stopSound("noise")
        Assets.playSound("bump", 4, 2)
        spr:setFrame(#Assets.getFrames("bullets/scrapscallion/pipe")-1)
        wait(1/30)
        Assets.stopSound("bump")
        Assets.playSound("damage")
        spr:setFrame(#Assets.getFrames("bullets/scrapscallion/pipe"))
        local dropx, dropy = self:getScreenPos()
        self:startDripping(dropx, dropy + (self.height * 1.5))
        wait(0.1)
        self:startDripping((dropx - self.width) + 20, dropy + (self.height * 1.5), 3)
        wait(0.1)
        self:startDripping((dropx + self.width) - 20, dropy + (self.height * 1.5), 3.1)
    end})
    self.timer = Timer()
    self:addChild(self.timer)
end

function bullet:startDripping(x,y, delay_mult)
    self.timer:script(function (wait)
        while true do
            local droplet = self.wave:spawnBullet("scrapscallion/droplet")
            droplet:setScreenPos(x, y)
            droplet.physics.gravity = 0.5
            droplet.physics.speed_x = Utils.random(-3,3)
            droplet.physics.friction = .05
            wait(self.delay * (delay_mult or 1))
        end
    end)
end

return bullet