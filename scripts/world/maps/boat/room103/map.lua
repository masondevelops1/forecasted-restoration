local Depths, super = Class(Map)

function Depths:onEnter()
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

  --Game.world.camera.attached_x = false -- prevent next line from getting overridden
  --Game.world.camera.attached_y = false -- prevent next line from getting overridden
  --Game.world.camera.x = Game.world.height / 1.5
  --Game.world.camera.y = Game.world.height / 1.5
end

return Depths