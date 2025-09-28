local Depths, super = Class(Map)

function Depths:onEnter()

  self.background = GonerBackground3() --note that GonerBackground isnt part of standard kristal, copy it or write a new one
  self.world:addChild(self.background)
  --Game.world.camera.attached_y = false -- prevent next line from getting overridden
  --Game.world.camera.y = Game.world.height / 5
end

return Depths