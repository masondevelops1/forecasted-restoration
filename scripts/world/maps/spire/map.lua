local map, super = Class(Map)



function map:onEnter()
local img1 = Game.world.map:getImageLayer("starssmall")
local img2 = Game.world.map:getImageLayer("starsbig")
local img3 = Game.world.map:getImageLayer("snowflakes")
  img1.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true  
  img2.sine_timer = 5
  img3.sine_timer = 10
    img1:setScale(1) -- sets the scale of the sprite
    img2:setScale(0.8) -- sets the scale of the sprite
    img3:setScale(1.5) -- sets the scale of the sprite
   



	
    img1.physics.speed_x = -1.80 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
    
    img2.physics.speed_x = -5.80 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
    img3.physics.speed_x = -8.80 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
end


function map:update()

  local img2 = Game.world.map:getImageLayer("starsbig")
  local img3 = Game.world.map:getImageLayer("snowflakes")
  
  img2.y = img2.init_y + math.sin(img2.sine_timer) * ((10))

  img2.sine_timer = (img2.sine_timer or 0) + DT


  img3.y = img3.init_y + math.sin(img3.sine_timer) * ((15))

  img3.sine_timer = (img3.sine_timer or 0) + DT

end

return map