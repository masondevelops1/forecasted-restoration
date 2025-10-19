local room, super = Class(Map)

function room:load()
  super.load(self)
  self.background = GonerBackground() --note that GonerBackground isnt part of standard kristal, copy it or write a new one
  self.world:addChild(self.background)
end

return room