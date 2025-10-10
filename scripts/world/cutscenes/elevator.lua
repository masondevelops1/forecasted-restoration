return {
  
elevatorcutscene = function(cutscene, event)

local img = Game.world.map:getImageLayer("Image Layer 1")
  
	cutscene:playSound("bell")
	cutscene:text("* You hit the elevator button labeled \"Floor 120.\"")
  
    img.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
    img:setScale(1) -- sets the scale of the sprite

    img:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
	
	cutscene:wait(2)
    img.physics.speed_y = -0.18 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
	
	cutscene:detachFollowers()
	   local x = event.x + event.width/2
       local y = event.y + event.height/2

	
	local rect = Rectangle(558, 720, 100, 200) -- i made up these numbers you'll have to adjust them however you need
	rect.color = {0, 0, 0} -- set its color to black (it's white by default)
	Game.world:spawnObject(rect, "objects") -- add the rectangle to the world. for most things you would use "addChild(rect)" instead, but World has a special "spawnObject" function to handle setting its layer correctly too
	local sound = Assets.newSound("elevator")
	sound:setVolume(0.1)
	sound:setPitch(0.8)
	sound:setLooping(true)
	sound:play()


	
	
	cutscene:playSound("impact")
	cutscene:shakeCamera()

	 local susie = cutscene:getCharacter("susie")
	 local ralsei = cutscene:getCharacter("ralsei")
	 local kris = cutscene:getCharacter("kris")
        if susie then
		--happy

		cutscene:wait(2)
		
		
		Game.world.timer:after (28, function()

			img.physics.speed_y = 0.0
			rect:remove()
			cutscene:playSound("grab")
			cutscene:shakeCamera()
			sound:stop()
			kris:resetSprite()
			
			
			cutscene:alignFollowers()
            
            cutscene:attachFollowers()
		end)
		
		
		local x, y = cutscene:getMarker("susie")
		cutscene:walkTo(susie, x, y + 20, 0.5, "right", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		susie:setSprite("susie_dream")
		end)
		
		local x, y = cutscene:getMarker("kris")
		cutscene:walkTo(kris, x, y + 20, 1, "right", true)
		Game.world.timer:after(3, function()
		cutscene:playSound("bump")
		kris:setSprite("sit")
		end)
		
		local x, y = cutscene:getMarker("ralsei")
		cutscene:walkTo(ralsei, x, y + 20, 1, "right", true)
		cutscene:wait(2)
		ralsei:setSprite("ralsei_dream")
		cutscene:playSound("swallow")
		ralsei.sprite:play(0.1, false)
		
		cutscene:wait(2)
		
		cutscene:setSpeaker(susie)
		cutscene:text("* Wow! These adventures are so much fun Kris!", "susie_dream_smile" )
		cutscene:text("* We should, like... Totally go on these more often.", "susie_dream_smug" )
		cutscene:text("* Wouldn't It Be Cool If We Could Go On These All The Time Kris?", "susie_dream_grin" )
		

		
		cutscene:wait(10)
		susie:setSprite("guh im not a real sprite call ecks dee")
		ralsei:setSprite("guh im not a real sprite call ecks dee")		
			
	    end
  end
}