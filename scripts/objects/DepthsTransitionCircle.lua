---@class DepthsTransitionCircle : Object
---@overload fun(x: number, y: number, offset: number, speed: number) : DepthsTransitionCircle
local DepthsTransitionCircle, super = Class(Object)

function DepthsTransitionCircle:init(x,y,offset,speed)
    super.init(self,x,y)
    self.radius = offset or 0
    self.speed = speed or 700
end

function DepthsTransitionCircle:update()
    self.radius = self.radius + (DT*self.speed)
    self.layer = self.layer - (DT*0.1)
end

function DepthsTransitionCircle:draw()
    Draw.setColor(COLORS.white)
    love.graphics.circle("fill", 0,0, self.radius)
    Draw.setColor(COLORS.black)
    love.graphics.circle("fill", 0,0, self.radius*.99    )
end

return DepthsTransitionCircle or Savepoint