local Depths, super = Class(Map)

function Depths:onEnter()
  self.world.player:addFX(FullbrightFX({glow = true}))
  for _, party in ipairs(self.world.followers) do
    party:addFX(FullbrightFX({glow = true}))
  end
  self:getTileLayer("emissive"):addFX(FullbrightFX())
  --self.world:getCharacter("spark"):addFX(FullbrightFX())
  

  Game.world.camera.attached_x = false -- prevent next line from getting overridden
  Game.world.camera.attached_y = false -- prevent next line from getting overridden
  Game.world.camera.x = Game.world.height / 1.5
  Game.world.camera.y = Game.world.height / 2
end

return Depths