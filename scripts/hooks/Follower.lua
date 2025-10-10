---@class Follower : Follower
local Follower, super = Class(Follower)

function Follower:setActor(actor)
    super.setActor(self,actor)
    if not self.sprite:getFX("battle_darken") then
        self.sprite:addFX(RecolorFX(1,1,1,1,-10), "battle_darken")
    end
    if not self.sprite:getFX("battle_alpha") then
        self:addFX(AlphaFX(1, -11), "battle_alpha")
    end
end

function Follower:update()
    super.update(self)
    local alphafx = self:getFX("battle_alpha")
    ---@cast alphafx AlphaFX
    if Game:isLight() then
        alphafx.alpha = 1 - (Game.world.battle_alpha/2)
    else
        alphafx.alpha = 1 - Game.world.battle_alpha
    end
end

return Follower