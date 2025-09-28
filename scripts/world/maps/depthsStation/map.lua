local Depths, super = Class(Map)

function Depths:load()
  super.load(self)
  self.background = GonerBackground3() --note that GonerBackground isnt part of standard kristal, copy it or write a new one
  self.world:addChild(self.background)
end

return Depths