return {
  
elevatorcutscene = function(cutscene, event)
	if Game:getFlag("elevator2done", false) == false then
		local img = Game.world.map:getImageLayer("Image Layer 1")
		local img2 = Game.world.map:getImageLayer("loop")

		cutscene:playSound("bell")
		cutscene:text("* You hit the elevator button labeled \"Floor 120.\"")

		img.wrap_texture_x = false -- this infinitely wraps the texture horizontally when set to true
		img2.wrap_texture_y = true -- this infinitely wraps the texture vertically when set to true
		img:setScale(1) -- sets the scale of the sprite
		img2:setScale(1) -- sets the scale of the sprite

		img:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
		img2:setParallax(0.1, 0.1) -- sets the manual x and y parallax scroll of the sprite.
		
		cutscene:wait(2)
		img.physics.speed_y = 0.1 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
		img2.physics.speed_y = 0.1 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
		
		cutscene:detachFollowers()
		local x = event.x + event.width/2
		local y = event.y + event.height/2

		
		local rect = Rectangle(240, 440, 100, 200) -- i made up these numbers you'll have to adjust them however you need
		rect.color = {0, 0, 0} -- set its color to black (it's white by default)
		Game.world:spawnObject(rect, "objects") -- add the rectangle to the world. for most things you would use "addChild(rect)" instead, but World has a special "spawnObject" function to handle setting its layer correctly too
		local sound = Assets.newSound("elevator")
		sound:setVolume(0.5)
		sound:setPitch(0.8)
		sound:setLooping(true)
		sound:play()


		
		Game:setFlag("elevatorstart", 1)
		cutscene:playSound("impact")
		cutscene:shakeCamera()

		local susie = cutscene:getCharacter("susie")
		local ralsei = cutscene:getCharacter("ralsei")
		local kris = cutscene:getCharacter("kris")
		if susie then
		--happy

		cutscene:wait(2)
		
		
		local x, y = cutscene:getMarker("susie")
		cutscene:walkTo(susie, x, y + 20, 0.5, "right", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		susie:setSprite("wall_right")
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
		ralsei:setAnimation({"sit", 0.4, next="sitting"})
		cutscene:playSound("swallow")
		ralsei.sprite:play(0.1, false)
		
		cutscene:wait(2)
		
		cutscene:setSpeaker(susie)
		cutscene:text("* Damn,[wait:5] 120 floors??", "surprise" )
		cutscene:text("* Hell yeah![wait:5] Straight to the top.", "smile" )
		cutscene:text("* We're in for a long ride...", "smirk" )
		cutscene:text("* So we might as well make ourselves comfortable,[wait:5] huh?", "closed_grin")
		cutscene:wait(2)
		ralsei:setSprite("yawn")
		cutscene:setSpeaker(ralsei)
		cutscene:text("* Yeah...", "yawn")
		cutscene:text("* Nice and comfy...", "sleepy")
		cutscene:wait(1)
		ralsei:setAnimation({"eep", 0.4, next="sleep"})
		ralsei:setSprite("sleep")
		ralsei.sprite:play(0.3, loop)
		cutscene:wait(4)
		cutscene:setSpeaker(susie)
		cutscene:text("* Heh![wait:5] Out like a lightbulb.", "susie_dream_smile")
		cutscene:text("* Quick,[wait:5] Kris!", "shy")
		cutscene:text("* Now's our chance to finally take over Castle Town![wait:5] Heh...", "teeth_smile" )
		cutscene:text("* ...", "suspicious")
		cutscene:text("* Hey Kris.", "neutral")
		cutscene:text("* Has Ralsei seemed a bit...", "neutral_side")
		cutscene:text("* Strange... to you recently?", "suspicious")
		cutscene:text("* I mean,[wait:5] sure,[wait:5] we've only known the guy for like,[wait:5] I dunno...", "neutral_side")
		cutscene:text("* Two days or so now...?", "suspicious")
		cutscene:text("* (Man...[wait:5] these past few days have felt like weeks...)", "nervous_side")
		cutscene:text("* But he's just seemed so...[wait:5] off today...[wait:5]\n* Y'know?", "neutral_side")
		cutscene:wait(5)
		cutscene:setSpeaker(susie)
		cutscene:text("* Like...", "sus_nervous")
		cutscene:text("* Oh yeah![wait:5] That business offer we got earlier![wait:5] What was that about!?", "teeth")
		cutscene:text("* He didn't even stop to think about it...", "annoyed_down")
		cutscene:text("* And he's supposed to be the REASONABLE one!", "sad")
		cutscene:wait(2)
		cutscene:setSpeaker(susie)
		cutscene:text("* I mean,[wait:5] this whole situation is pretty damn weird...", "stupid")
		cutscene:text("* Like,[wait:5] how the hell did we wake up in a Dark World!?", "teeth")
		cutscene:text("* And the fountain,[wait:5] too![wait:5] Where the HELL is it??[wait:5] I haven't seen it ONCE!", "teeth_b")
		cutscene:wait(0.5)
		cutscene:setSpeaker(susie)
		cutscene:text("* And really,[wait:5] you'd think if we'd see it from anywhere...", "sus_nervous")
		susie.sprite:setWalkSprite("walk")
		susie.sprite:setFacing("up")
		local x, y = cutscene:getMarker("susie2")
		cutscene:wait(cutscene:walkTo(susie, x, y, 0.3, "up", true))
		susie:setSprite("point_up")
		susie.sprite:play(0.4, loop)
		cutscene:text("* It'd be from here,[wait:5] the TV Tower or whatever!", "angry_c")
		cutscene:wait(0.7)
		susie:setSprite("point_up_turn")
		cutscene:text("* Man,[wait:5] I've never even seen a building this tall...", "nervous")
		cutscene:wait(1)
		susie:setSprite("right_1")
		cutscene:wait(0.5)
		susie:setSprite("down_1")
		cutscene:wait(1.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		susie.sprite:setWalkSprite()
		susie:setSprite("downed")
		cutscene:wait(2)
		cutscene:setSpeaker(susie)
		cutscene:text("* I guess it's a pretty nice view,[wait:5] though.", "annoyed_down")
		cutscene:text("* Can't blame that TV Guy for choosing this place as his hideout...", "nervous")
		cutscene:text("* It all just feels so unreal...", "nervous_side")
		cutscene:text("* (Maybe this all really is just a dream...)", "stupid")
		cutscene:wait(3)
		susie:setSprite("down_happy")
		cutscene:setSpeaker(susie)
		cutscene:text("* Heh,[wait:5] who am I kidding!?", "smile")
		cutscene:text("* Who could complain about an adventure like THIS,[wait:5] right Kris?", "susie_dream_grin")
		cutscene:wait(1)
		susie:setSprite("downed")
		cutscene:text("* I just hope Ralsei's okay...[wait:5] y'know?", "shy_down")
		cutscene:wait(6)
		susie.sprite:setWalkSprite("walk")
		susie.sprite:setFacing("right")
		local x, y = cutscene:getMarker("susie3")
		cutscene:wait(cutscene:walkTo(susie, x, y, 0.2, "right", true))
		susie:setSprite("exasperated_right")
		cutscene:text("* RALSEI!!!![wait:5] WAKE UP ALREADY!![wait:5] We're almost to the top!", "teeth")
		susie:setSprite("right_1")
		ralsei:setSprite("yawn")
		cutscene:setSpeaker(ralsei)
		cutscene:text("* W-[wait:5]huh...", "sleepy")
		cutscene:wait(0.2)
		ralsei:setSprite("surprised_down")
		cutscene:text("* O-Oh![wait:5] Sorry!", "shock")
		susie.sprite:setWalkSprite("walk")
		susie.sprite:setFacing("up")
		ralsei.sprite:setWalkSprite("walk")
		ralsei.sprite:setFacing("up")
		kris.sprite:setWalkSprite("walk")
		kris.sprite:setFacing("down")
		local x1, y1 = cutscene:getMarker("susie4")
		local x2, y2 = cutscene:getMarker("ralsei2")
		local x3, y3 = cutscene:getMarker("kris2")
		cutscene:walkTo(susie, x1, y1, 1, "up", true)
		cutscene:walkTo(ralsei, x2, y2, 1, "up", true)
		cutscene:walkTo(kris, x3, y3, 1, "down", true)
		Game.world.timer:after (10, function()
			img.physics.speed_y = 0.0
			img2.physics.speed_y = 0.0
			rect:remove()
			cutscene:playSound("grab")
			cutscene:shakeCamera()
			sound:stop()
			kris:resetSprite()
			susie:resetSprite()
			ralsei:resetSprite()
			Game:setFlag("elevator2done", true)		
			cutscene:alignFollowers()
			
			cutscene:attachFollowers()
		end)	
			
		end
	else
		cutscene:playSound("bell")
		cutscene:text("* You hit the elevator button labeled \"Floor 20.\"")
		cutscene:text("* It looks like the elevator only goes up.")
	end
end
}