---@generic T:Object
---@class ShakyObject : Object
---@field child Object
---@overload fun(child:Object, shaky:number?, x:number?,y:number?) : ShakyObject
local ShakyObject, super = Class(Object)

function ShakyObject:init(child,shaky, x,y)
    super.init(self,x,y)
    self:addChild(child)
    child.inherit_color = true
    self.child = child
    self.shaky = shaky or 4
end

function ShakyObject:applyTransformTo(transform, floor_x, floor_y)
    if self.shaky then
        transform:translate(love.math.random(-self.shaky,self.shaky), love.math.random(-self.shaky,self.shaky))
    end
    super.applyTransformTo(self, transform, floor_x, floor_y)
end

return ShakyObject