---@class PongPaddle: Object
---@field parent PongMinigame
---@overload fun(...): PongPaddle
local PongPaddle, super = Class(Object)

function PongPaddle:init(texture, x,y)
    super.init(self, x, y)
    self.sprite = Sprite(texture)
    self.sprite.inherit_color = true
    self:addChild(self.sprite)
    self.sprite.path = "objects/pongMinigame"
    self:setSize(self.sprite:getSize())
    self:setSize(self.width/2,self.height * 0.8)
    self.speed = 4
    self:setHitbox(0,0,self:getSize())
    self.bounce_collider = LineCollider(self, 0, 0, 0, self.height)
    self.health = 3
end

function PongPaddle:onAdd(parent)
    super.onAdd(self,parent)
    self.sprite:setScaleOriginExact((self.width) - (self.sprite.x), self.height/2)
end

---@param direction "up"|"down"
function PongPaddle:processInput(direction)
    local y = assert((direction == "up" and -1) or (direction == "down" and 1), "bad argument #1 to PongPaddle:doInput (expected \"up\" or \"down\")")
    self:move(0, y, self.speed * DTMULT)
end

function PongPaddle:draw()
    super.draw(self)
    if DEBUG_RENDER then
        self.collider:drawFor(self)
        self.bounce_collider:drawFor(self, 1,0,1)
    end
end

function PongPaddle:hurt()
    self.sprite:shake(0,4)
    Assets.stopAndPlaySound("damage")
    self.health = self.health - 1
    if self.health <= 0 then
        self:explode()
    end
end

function PongPaddle:onBounce(ball)
    self.sprite:play(2/30, false, function (sprite)
        self.sprite:setFrame(1)
    end)
end

function PongPaddle:explode(x, y, dont_remove, options)
    options = options or {}
    if options.play_sound ~= false then
        Assets.playSound("explosion")
    end
    options.play_sound = false
    dont_remove = dont_remove ~= false
    super.explode(self,x,y,dont_remove,options)
end

return PongPaddle