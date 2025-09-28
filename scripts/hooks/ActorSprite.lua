---@class ActorSprite : ActorSprite
local ActorSprite, super = Class(ActorSprite)

function ActorSprite:setColor(r,g,b,a)
    if self:getFX("battle_darken") then
        self:getFX("battle_darken"):setColor(r,g,b,a)
    else
        super.setColor(self,r,g,b,a)
    end
end

return ActorSprite