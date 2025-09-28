---@overload fun(x:number,y:number,offset:number):DepthsTransition
---@class DepthsTransition : Object
local DepthsTransition, super = Class(Object)

function DepthsTransition:init(x,y,offset)
    super.init(self,x,y)
    self:setParallax(0)
    self.offset = offset or 0
    self.timer = self:addChild(Timer())
    self.fall_sound = Assets.playSound("depths_fall")
    local iter = 0
    self.timer:every(1/8, function ()
        iter = iter + 1
        if iter == 6 then
            for i = 400, 200, -50 do
                self:addChild(DepthsTransitionCircle(0,0,self.offset, i))
            end
            self.update_child_list = true
        else
            self:addChild(DepthsTransitionCircle(0,0,self.offset, 700))
        end
    end, 6)
end

return DepthsTransition