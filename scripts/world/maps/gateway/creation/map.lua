local Core, super = Class(Map)

function Core:load()
  super.load(self)
  self.background = GonerBackground2() --note that GonerBackground isnt part of standard kristal, copy it or write a new one
  self.world:addChild(self.background)
end

return Core