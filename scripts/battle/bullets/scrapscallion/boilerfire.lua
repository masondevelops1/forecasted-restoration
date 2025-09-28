---@class Bullet.scrapscallion.boilerfire : Bullet
local bullet, super = Class(Bullet, "scrapscallion.boilerfire")

function bullet:init(x,y)
    super.init(self, x,y)
    self:setOrigin(0, 1 or TileObject.init)
    self:setSprite("bullets/scrapscallion/boilerfire/spread")
    self.destroy_on_hit = false
    self.sprite.path = "bullets/scrapscallion/boilerfire"
    self.sprite:setAnimation{ "spread", 0.05 }
    self:setHitbox(1,26,28,9)
    self.sprite.anim_callback = function (sprite)
        self:setHitbox(1,26,69 --[[dont say it]],100)
        sprite:setAnimation{"idle", 0.1, true}
        self:startRising()
    end
    self.shader = Assets.newShader("gradientwave")
    self.shader:send("texsize", {self:getSize()})
    self.shader:send("wave_mag", 4)
    self.shader:send("wave_height", 2)
    self.time = 0

    self.speed = -0.5
end

function bullet:update()
    super.update(self)
    self.time = self.time + DT
end

function bullet:startRising()
    self.physics.speed_y = self.speed
end

function bullet:draw()
    local orig_shader = love.graphics.getShader()
    self.shader:send("wave_sine", RUNTIME * math.pi * 60)
    self.shader:send("wave_mag", Utils.clampMap(self.time, 0, 1, 0, 2))
    love.graphics.setShader(self.shader)
    super.draw(self)
    love.graphics.setShader(orig_shader)
    love.graphics.rectangle("fill", 0, self.height, self.width, 100)
end

return bullet