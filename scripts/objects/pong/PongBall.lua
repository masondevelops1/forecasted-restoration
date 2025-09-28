---@class PongBall: Sprite
---@field parent PongMinigame
---@overload fun(...): PongBall
local PongBall, super = Class(Sprite)

function PongBall:init(x,y)
    super.init(self, "objects/pongMinigame/ball", x, y)
    self:play(0.1, true)
end

function PongBall:move(x,y,speed)
    x = x * (speed or 1)
    y = y * (speed or 1)
    local ox, oy = self.x, self.y
    self.x = self.x + x
    if self.parent:checkSolidCollision(self) then
        Assets.playSound("bump",5,3)
        local vx, vy = math.cos(self.physics.direction), math.sin(self.physics.direction)
        vx = -vx
        self.physics.direction = math.atan2(vy, vx)
        self.x = ox
    end
    self.y = self.y + y
    if self.parent:checkSolidCollision(self) then
        Assets.playSound("bump",5,3)
        local vx, vy = math.cos(self.physics.direction), math.sin(self.physics.direction)
        vy = -vy
        self.physics.direction = math.atan2(vy, vx)
        self.y = oy
    end
end

return PongBall