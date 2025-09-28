local bg, super = Class(Object)

function bg:init()
  super.init(self)
  local background = GonerBackground2() --note that GonerBackground isnt part of standard kristal, copy it or write a new one
  self:addChild(self.background)
  background.layer = 1
end

return bg