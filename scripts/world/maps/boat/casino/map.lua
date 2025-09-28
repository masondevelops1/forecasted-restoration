local Depths, super = Class(Map)

function Depths:onEnter()
  Game.world.camera.attached_x = false -- prevent next line from getting overridden
  Game.world.camera.attached_y = false -- prevent next line from getting overridden
  Game.world.camera.x = Game.world.height / 1.5
  Game.world.camera.y = Game.world.height / 2
end

return Depths