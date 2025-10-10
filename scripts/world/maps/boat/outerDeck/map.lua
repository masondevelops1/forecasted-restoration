---@class Map.boat.outerDeck : Map
local map, super = Class(Map)

function map:onEnter()
  local img = self:getImageLayer("stars_big")
  local img1 = self:getImageLayer("stars_mid")
  local img2 = self:getImageLayer("stars_small")

  img.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img:setScale(1) -- sets the scale of the sprite
  img.physics.speed_x = 0.18 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img1.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img1:setScale(1) -- sets the scale of the sprite
  img1.physics.speed_x = 0.25 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img2.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img2:setScale(1) -- sets the scale of the sprite
  img2.physics.speed_x = 0.30 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  local options = {glow = true, color = {.7,.7,.7}}
  self.world.player:addFX(FullbrightFX(options))
  for _, party in ipairs(self.world.followers) do
    party:addFX(FullbrightFX(options))
  end

  self.dock_layer = self:getTileLayer("disappearonactstart") ---@type TileLayer
  self.dock_hitbox = self:getHitbox("dock come on man (tf2 reference)") ---@type Hitbox
end

function map:update()
  super.update(self)
  self.dock_hitbox.collidable = Plot:between("boat_act1_start", "boat_end")
  self.dock_layer.visible = not self.dock_hitbox.collidable
end

return map