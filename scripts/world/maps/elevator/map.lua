local elevator, super = Class(Map)

function elevator:load()
  super:load(self)
  local img = Game.world.map:getImageLayer("Image Layer 1")
  
    img.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
    img:setScale(1) -- sets the scale of the sprite

    img:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
	
	img.physics.speed_y = 0.0 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
	
end

return elevator