local Depths, super = Class(Map)

function Depths:onEnter()
    self.world.player:addFX(FullbrightFX({glow = true}))
    for _, party in ipairs(self.world.followers) do
      party:addFX(FullbrightFX({glow = true}))
    end
end

return Depths