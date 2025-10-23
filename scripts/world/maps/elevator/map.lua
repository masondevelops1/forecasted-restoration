local elevator, super = Class(Map)

function elevator:load()
  super.load(self)
  local img = Game.world.map:getImageLayer("Image Layer 1")
  local img2 = Game.world.map:getImageLayer("loop")
  
    img.wrap_texture_x = false -- this infinitely wraps the texture horizontally when set to true
    img2.wrap_texture_y = false -- this infinitely wraps the texture vertically when set to true
    img:setScale(1) -- sets the scale of the sprite
    img2:setScale(1) -- sets the scale of the sprite
    img:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
    img2:setParallax(0.1, 0.1) -- sets the scale of the sprite
	
	img.physics.speed_y = 0.0 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
  img2.physics.speed_y = 0.0 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
  Game:setFlag("elevator2done", false)		
end

return elevator