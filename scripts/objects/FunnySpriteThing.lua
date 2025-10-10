---@class FunnySpriteThing: Object
---@overload fun(...):FunnySpriteThing
local FunnySpriteThing, super = Class(Object)

function FunnySpriteThing:init(tex, x,y)
    super.init(self, x, y)
    self.sprite = Sprite(tex)
    self.sprite.inherit_color = true
    self:addChild(self.sprite)
    self:setSize(self.sprite:getSize())
    self:setOrigin(0.5)
end

function FunnySpriteThing:move(x,y,speed)
    local angle = math.atan2(y,x)
    local flipped_angle = angle + math.pi
    local angle_dist = math.abs(Utils.angleDiff(self.rotation, angle))
    local flipped_angle_dist = math.abs(Utils.angleDiff(self.rotation, flipped_angle))
    if angle_dist < flipped_angle_dist then
        self.rotation = angle
    else
        self.rotation = flipped_angle
    end
    
    super.move(self,x,y,speed)
end

return FunnySpriteThing