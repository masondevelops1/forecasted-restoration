---@class Map.Depths : Depths
local Depths, super = Class(Map)

function Depths:onEnter()

  self.background = GonerBackground3() --note that GonerBackground isnt part of standard kristal, copy it or write a new one
  self.world:addChild(self.background)
  --Game.world.camera.attached_y = false -- prevent next line from getting overridden
  --Game.world.camera.y = Game.world.height / 5
  self.dock_hitbox = self:getHitbox("BRIDGE RUOK") ---@type Hitbox
  local img = Game.world.map:getImageLayer("bridge1")
  local img1 = Game.world.map:getImageLayer("bridge2")
  local img2 = Game.world.map:getImageLayer("bridge3")
  img3 = Game.world.map:getImageLayer("powered")
  img.visible = false
  img1.visible = false
  img2.visible = false
  img3.visible = false
  if not Plot:isBefore("depths_bridge") then
    img.visible = true
    img1.visible = true
    img2.visible = true
    img3.visible = true
  end
end

function Depths:update()
  super.update(self)
  self.dock_hitbox.collidable = Plot:between("initial", "depths_bridge")
  if not Plot:isBefore("depths_powered3") then
    img3.visible = true
  end
end
return Depths