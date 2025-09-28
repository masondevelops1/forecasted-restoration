---@class AbsoluteAfterImage : AfterImage
---@overload fun(...) : AbsoluteAfterImage
local AbsoluteAfterImage, super = Class(AfterImage)

function AbsoluteAfterImage:onAdd(parent)
    self:setPosition(Game.world.camera:getPosition())
    self:move(-SCREEN_WIDTH/2, -SCREEN_HEIGHT/2)
    local sibling

    local other_parents = self.sprite:getHierarchy()
    for _, v in ipairs(self:getHierarchy()) do
        for i, o in ipairs(other_parents) do
            if o.parent and o.parent == v then
                sibling = o
                break
            end
        end
        if sibling then break end
    end

    if sibling then
        self.layer = sibling.layer - 0.001
    end
end

function AbsoluteAfterImage:applyTransformTo(transform)
    Object.applyTransformTo(self, transform)
end


return AbsoluteAfterImage
