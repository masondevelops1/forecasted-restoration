return {
  
doorInteract = function(cutscene, event)
  local interactionsDoor = Game:getFlag("interactedDoor", 0)
  local kris = cutscene:getCharacter("kris")
  local susie = cutscene:getCharacter("susie")
  if interactionsDoor <= 5 then
    cutscene:playSound("bump")
    cutscene:shakeCamera()
    cutscene:wait(1)
    cutscene:text("* You place the key in the door,[wait:5] and it")	
  elseif interactionsDoor <= 7 then
		cutscene:setSpeaker("susie")
    cutscene:text("* Kris,[wait:5] I don't think that key is working...", "sus_nervous")	
  end
  Game:setFlag("interactedDoor", interactionsDoor + 1)	
end,

sign1 = function(cutscene, event)
  
  cutscene:text("* Out of commission!\n[wait:10]* Come back never.")	
        
  end,

eggGuy = function(cutscene, event)
  cutscene:text("* I'm meant to have animated talking sprites but I don't.")
  cutscene:text("* I am a god damn failiure!")
end,

unused = function(cutscene, event)
  Assets.playSound("noise")

end,

unused1 = function(cutscene, event)
  cutscene:text("")

end,


sign2 = function(cutscene, event)

  cutscene:text("* There's a sign here.[wait:10] It has a job notice attached: ")	
  cutscene:text("* \"I need someone to watch this dock.\" ")	
  cutscene:text("* \"It's basically guaranteed job security.[wait:10] Ships don't travel here anymore.\" ")	
  cutscene:text("* \"You will be paid in free walls to sit on.\" ")	
  cutscene:text("* - Signed,[wait:5] Egglebert III ")	        
  end,

door1 = function(cutscene, event)
  
  cutscene:text("* It's boarded up and filled with debris.")	
          
  end,


terminal = function(cutscene, event)
  local img3 = Game.world.map:getImageLayer("powered")
  local platform = cutscene:getCharacter("platform")
  cutscene:playSound("noise")
  cutscene:playSound("bell")
  cutscene:shakeCamera()
  img3.visible = true
  cutscene:wait(1)
  platform:setSprite("idle_online")
  cutscene:wait(0.5)
  cutscene:text("* Southbound terminal activated.")	
  cutscene:text("* Platform power restored!")	
  cutscene:text("* (Remaining terminals:\n[wait:10]-Eastbound terminal\n[wait:10]-Westbound terminal)")
          
  end,
  

kriswakeup = function(cutscene, event)
  local kris = cutscene:getCharacter("kris")
  kris:setSprite("fell")
  cutscene:wait(3)
  cutscene:shakeCharacter("kris")
  kris:setSprite("sit")
  cutscene:wait(2.5)
  cutscene:shakeCharacter("kris")
  cutscene:wait(1)
  cutscene:shakeCharacter("kris")
  cutscene:wait(0.2)
  kris:resetSprite()
  cutscene:look(kris, "right")
end,

platform1 = function(cutscene, event) 
  local platform = cutscene:getCharacter("platform")
  local kris = cutscene:getCharacter("kris")
  --local susie = cutscene:getCharacter("susie")

  local x, y = cutscene:getMarker("markerplatform")
  cutscene:shakeCamera()
  
  cutscene:playSound("noise")
  cutscene:playSound("bell")
  local rumble = Assets.playSound("rumble")
  platform:setSprite("left")
	rumble:setLooping(true)
  cutscene:slideToSpeed(kris, x, kris.y, 4)
  --cutscene:slideToSpeed(susie, x, susie.y, 4)
  cutscene:slideToSpeed(platform, x, y, 4)
  cutscene:wait(3.1)
  cutscene:playSound("impact")
  Assets.stopSound("rumble")
  cutscene:shakeCamera()
  kris:resetSprite()
  platform:setSprite("idle_online")
end,


platform2 = function(cutscene, event) 
  local platform = cutscene:getCharacter("platform")
  local kris = cutscene:getCharacter("kris")
 -- local susie = cutscene:getCharacter("susie")

  local x, y = cutscene:getMarker("markerbridge")
  cutscene:shakeCamera()
  cutscene:playSound("noise")
  cutscene:playSound("bell")
  local rumble = Assets.playSound("rumble")
  platform:setSprite("right")
	rumble:setLooping(true)
  cutscene:slideToSpeed(kris, x, kris.y, 4)
 -- cutscene:slideToSpeed(susie, x, susie.y, 4)
  cutscene:slideToSpeed(platform, x, y, 4)
  cutscene:wait(3.1)
  cutscene:playSound("impact")
  Assets.stopSound("rumble")
  cutscene:shakeCamera()
  kris:resetSprite()
  platform:setSprite("idle_online")
end,

krisSlip = function(cutscene, event)
  local kris = cutscene:getCharacter("kris")
  local susie = cutscene:getCharacter("susie")
  cutscene:detachFollowers()
  local x, y = cutscene:getMarker("krisfallen")
	cutscene:walkTo(kris, x, y, 1, "up")
  kris:setSprite("grab")
  cutscene:wait(2)

  local x, y = cutscene:getMarker("susie1")
  cutscene:walkTo(susie, x, y, 1, "up")
  susie:setSprite("grab")
  cutscene:wait(2)

  cutscene:shakeCharacter("kris")
	cutscene:playSound("bump")
  cutscene:wait(0.5)
  cutscene:setSpeaker(susie)
	cutscene:text("* KRIS!!", "angry")

  cutscene:shakeCharacter("kris")
	cutscene:playSound("bump")
  cutscene:wait(0.5)
  cutscene:shakeCharacter("kris")
	cutscene:playSound("bump")
  cutscene:wait(0.5)
  cutscene:shakeCharacter("kris")
	cutscene:playSound("bump")

  local x, y = cutscene:getMarker("susie2")
  cutscene:slideToSpeed(susie, x, y, 6)
  cutscene:shakeCamera()
  cutscene:playSound("impact")
  

  local x, y = cutscene:getMarker("kris1")
  cutscene:walkTo(kris, x, y, 0.3, "up")
  kris:setSprite("fell")
  cutscene:playSound("noise")
  cutscene:wait(0.5)

  
  cutscene:playSound("wing")
  susie:setSprite("up_1")
  cutscene:wait(0.3)
  cutscene:text("* Kris?![wait:5] Are you alright??\n[wait:10]* You were completely out of it!!", "sad_frown")
  cutscene:text("* Scared the CRAP out of me,[wait:5] y'know that?[wait:5]", "sad_frown")
  cutscene:text("* You got so...[wait:10] dark,[wait:5] for a second there.", "surprise_frown")
  cutscene:text("* And then you started to fall.[wait:5]", "nervous")
  cutscene:wait(2)
  cutscene:text("* Look, [wait:5]I know you didn't want to come back here, [wait:5]but...", "annoyed_down")
  cutscene:text("* We can't give up right now. \n[wait:10]* We're in too deep.", "sus_nervous")
  kris:setSprite("sit")
  cutscene:playSound("bump")
  cutscene:shakeCharacter("kris")
  cutscene:text("* Ralsei never takes this long to find us in a Dark World.[wait:10]", "nervous")
  susie:setSprite("left_1")
  cutscene:playSound("wing")
  cutscene:wait(1)
  susie:setSprite("right_1")
  cutscene:playSound("wing")
  cutscene:wait(1)
  cutscene:text("* Not to mention Noelle,[wait:5] she can't have gone that far.", "nervous")
  cutscene:wait(1)
  susie:setSprite("up_1")
  cutscene:text("* But I'm worried about her.[wait:10] And I'm worried about him.", "neutral")
  cutscene:text("* Hell, I'm not even sure if this is a Dark World anymore...", "nervous")
  cutscene:text("* There's no fountain in sight, and we know how that went last time.", "nervous_side")
  cutscene:text("* Something just feels..[wait:5] very wrong.", "nervous_side")
  cutscene:wait(2)
  cutscene:text("* Kris,[wait:5] I know you're afraid of that guy,[wait:5] but...", "nervous")
  cutscene:text("* WE'RE GONNA KICK HIS ASS!!!", "teeth_b")
  cutscene:text("* No matter what it takes.", "teeth_smile")
  cutscene:wait(2)
  cutscene:text("* Let's get out of here.", "neutral")
  cutscene:text("* We gotta find the others.", "neutral" )
  kris:resetSprite()
  cutscene:playSound("bump")
  cutscene:shakeCharacter("kris")
  local x, y = cutscene:getMarker("kris2")
  cutscene:walkTo(kris, x, y, 3, "down")
  cutscene:wait(3.5)
  susie:resetSprite()
  cutscene:attachFollowers()
  cutscene:text("* ...and make sure this thing doesn't explode.", "nervous" )

  
  cutscene:wait(1)
  
  
end,

bridgeDeploy = function(cutscene, event)
  cutscene:text("* There's a mechanism here.\n[wait:10] * A note is attached.")
  cutscene:text("* \"Password for bridge deployment:[wait:5] 1234\"")
  cutscene:text("* The mechanism is completely unresponsive.")
  cutscene:text("* Kick it?")
  local choice = cutscene:choicer({"Yes", "No"})
  
  if choice == 1 then
    cutscene:playSound("impact")
    cutscene:shakeCamera()
    cutscene:text("* You kick the mechanism.")
    cutscene:wait(2)
    local img = Game.world.map:getImageLayer("bridge1")
    local img1 = Game.world.map:getImageLayer("bridge2")
    local img2 = Game.world.map:getImageLayer("bridge3")
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    img.visible = true
    cutscene:wait(0.5)
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    img1.visible = true
    cutscene:wait(0.5)
    cutscene:shakeCamera()
    cutscene:playSound("noise")
    img2.visible = true

    local door = Game.world.map:getEvent(1)
    door:remove()
  end
end,




jump = function (cutscene)
  local kris = cutscene:getCharacter("kris")

  local x, y = cutscene:getMarker("midair")
  cutscene:slideTo(kris, x, y, 0.3)
  kris:setSprite("ball")
  kris.sprite:play(0.3, loop)
  cutscene:playSound("jump")
  cutscene:wait(0.2)
  local x, y = cutscene:getMarker("camfocus")
  cutscene:slideTo(kris, x, y, 0.3)
  cutscene:wait(0.3)
  kris:setSprite("landed_2")
  cutscene:playSound("impact")
  cutscene:shakeCamera()
  cutscene:wait(1)
  kris:resetSprite()
  cutscene:shakeCharacter(kris)
  cutscene:playSound("noise")
end,


signoutside = function (cutscene)
  cutscene:text("* This lift will take you to The Evergroves.")
  cutscene:text("* (Note:[wait:10] You may not be able to backtrack beyond this point.)")
  if Game.money < 9821 then
    Game.money = Game.money + 9821
  end
  love.window.setTitle("DELTARUNE Chapter 6")

end,

savecutscene = function (cutscene)
  cutscene:text("* This lift will take you to The Evergroves.")
  cutscene:text("* (Note: You may not be able to backtrack beyond this point.)")
end,


sans = function (cutscene)
  local interactionsSans = Game:getFlag("interactedSans", 0)
  local sans = cutscene:getCharacter("sans")
  local susie = cutscene:getCharacter("susie")
  if interactionsSans < 1 then
    cutscene:setSpeaker(susie)
    cutscene:text("* YOU AGAIN???", "teeth_b")
    cutscene:text("* Look.[wait:10] Surely the jerky didn't cost that much...", "nervous_side")
    cutscene:text("* What are you even doing here??", "surprise")
    cutscene:setSpeaker(sans)
    cutscene:text("* hey.[wait:10] i'm just tending to the baskets.", "neutral")
    cutscene:text("* i'll tell ya what.", "eyes_closed")
    cutscene:text("* take this list.\n[wait:10]* i need 5 eggs.", "neutral")
    cutscene:text("* get them,[wait:5] and i'll forget about the jerky.[wait:10]\n* no strings attached.", "neutral")
    cutscene:setSpeaker(susie)
    cutscene:text("* ...", "nervous")
    cutscene:text("* You run a grocery store.", "annoyed")
    cutscene:setSpeaker(sans)
    cutscene:text("* they're in high demand.", "joking")
    cutscene:text("* in this economy?[wait:10] they're a real prize.", "neutral")
    cutscene:setSpeaker(susie)
    cutscene:text("* YOU HAVE A BASKET OF EGGS RIGHT THERE!!!", "teeth")
    cutscene:setSpeaker(sans)
    cutscene:text("* oh yeah.\n[wait:10]* those are my show eggs.", "neutral")
    cutscene:text("* they're for show,[wait:5] you can try to take one.", "neutral")
    cutscene:setSpeaker(susie)
    cutscene:text("* Kris,[wait:5] I already stole something today.[wait:10] It's your turn.", "teeth_smile")
  elseif interactionsSans == 1 then
    cutscene:setSpeaker(susie)
    cutscene:text("* Alright,[wait:5] give us the list.[wait:5] We'll go find the eggs...", "nervous")
    cutscene:text("* (Kris!![wait:10] Where the hell are we gonna find 5 eggs???)", "shy")
    cutscene:setSpeaker(sans)
    cutscene:text("* you got it.[wait:10]\n* it's all yours.", "look_left")
    Assets.playSound("item")
    cutscene:setSpeaker()
    Game.inventory:tryGiveItem("shoppinglist")
    cutscene:text("* (You got the ShoppingList.)")
    cutscene:setSpeaker(sans)
    cutscene:text("* huh,[wait:5] seems like you already have all the eggs.", "neutral")
    cutscene:text("* don't worry,[wait:5] you can keep them.", "neutral")
    cutscene:text("* i'm sure they were tough to get.", "wink")
    Assets.playSound("ominous")
    Game.world.music:stop()
  elseif interactionsSans >= 2 then
    cutscene:setSpeaker(sans)
    cutscene:text("* just remember...", "neutral")
    cutscene:text("* don't put all your eggs in one basket.", "wink")
  end
  Game:setFlag("interactedSans", interactionsSans + 1)	
end,

sailor = function (cutscene)
  local img = Game.world.map:getImageLayer("stars big")
  local img1 = Game.world.map:getImageLayer("stars medium")
  local img2 = Game.world.map:getImageLayer("stars small")
  local img3 = Game.world.map:getImageLayer("dock")
  local img4 = Game.world.map:getImageLayer("dockL")
  local img5 = Game.world.map:getImageLayer("mangroves")
  local sailor = cutscene:getCharacter("sailor")
  local kris = cutscene:getCharacter("kris")

  cutscene:setSpeaker(sailor)
  cutscene:text("* Welcome,[wait:5] friend.[wait:10] Another lost soul in the deep,[wait:5] I see.")
  cutscene:text("* Your light is fading.")
  cutscene:text("* Let me show you the path,[wait:5] friend.")
  cutscene:text("* It's important that we stick together...[wait:10] us wanderers of the dark.")
  cutscene:wait(1)
  cutscene:text("* Where are you headed,[wait:5] young one?")
  local choice = cutscene:choicer({"South Harbor", "West Harbor", "North Harbor"})

  

  cutscene:text("* To explore the vast ocean of time.[wait:10] That's what we do in these depths.")
  cutscene:text("* Let's go,[wait:5] friend.")

  sailor:setSprite("paddle")
  local swoosh = Assets.playSound("swoosh")
  swoosh:setLooping(true)
  sailor.sprite:play(0.3, loop)

  img3:setScale(1) -- sets the scale of the sprite
  img3.physics.speed_x = 0.40 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  cutscene:wait(6)
  
  cutscene:text("* So you're one who comes from the light,[wait:5] aren't you?")
  cutscene:text("* It's been a very long time since I've seen one of your kind.")
  cutscene:text("* But recently,[wait:5] all sorts of things have been changing down here.")
  cutscene:text("* I suppose a new face should be of no surprise to me.")

  cutscene:wait(2)
  
  cutscene:look(kris, "left")
  cutscene:playSound("wing")
  cutscene:wait(2)
  cutscene:text("* You're looking for your friends?")
  cutscene:text("* I see.[wait:10] We have an important matter on our hands,[wait:5] don't we.")
  
  cutscene:text("* It's been long since I've seen my own.[wait:10] It's the least I could do for a new one.")
  kris:resetSprite()
  cutscene:text("* Make yourself comfortable,[wait:5] friend.[wait:10] It's a long,[wait:5] dark,[wait:5] journey ahead of us.")
  cutscene:wait(2)
  
  local x, y = cutscene:getMarker("kris1")
  cutscene:walkTo(kris, x, y, 2, "left")
  cutscene:wait(2.5)
  cutscene:shakeCharacter("kris")
  kris:setSprite("chilling")
  kris.sprite:play(0.3, loop)
  cutscene:playSound("noise2")
  cutscene:wait(0.5)
  cutscene:wait(3)

  cutscene:text("* I've never felt the desire to visit The Evergroves myself.")
  cutscene:text("* Though I hear connections to it have been shut down due to recent phenomena.")
  cutscene:text("* Tales have been told of a forest dream that attracts people to the area.")
  cutscene:text("* Some of my friends traveled out there many years ago.")
  cutscene:text("* That would be,[wait:5] unfortunately, the last time I'd see them.")
  cutscene:wait(3)
  cutscene:text("* It has existed as long as time,[wait:5] but I spend my days sailing these waters,[wait:5] singing my songs.")


  img.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img:setScale(1) -- sets the scale of the sprite
  img.physics.speed_x = 0.18 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img1.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img1:setScale(1) -- sets the scale of the sprite
  img1.physics.speed_x = 0.25 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img2.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img2:setScale(1) -- sets the scale of the sprite
  img2.physics.speed_x = 0.30 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.


  img5.wrap_texture_x = false -- this infinitely wraps the texture horizontally when set to true
  img5:setScale(1) -- sets the scale of the sprite
  img5.physics.speed_x = 0.04 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
  text.parallax_x = 0
  text.parallax_y = 0
  text.layer = WORLD_LAYERS["textbox"]
  Game.world:addChild(text)
  
  text.alpha = 0
  local textWait = function() return text:isDone() end

  Game.world.timer:tween(1, text, { alpha = 1 })
 
  local x, y = cutscene:getMarker("cameratarget2")
  
  
  cutscene:panTo("cameratarget2", 13) --pan camera to marker named "camera_target" over 2 seconds
  cutscene:wait(4)

  local song = Assets.playSound("seasong")
  song:setLooping(false)

  cutscene:wait(17)
  
  text:setText("[voice:none]My [wait:40]new [wait:8.5]life, [wait:37]be[wait:9]low [wait:10]the [wait:9]stars. ")
  cutscene:wait(7.5)
  text:setText("[voice:none]My[wait:9] world[wait:30] has[wait:8] changed-[wait:45] \nand[wait:1] it's[wait:2] stran[wait:7]ger[wait:2] than[wait:8] be[wait:2]fore.[wait:4]")
  cutscene:wait(8.4)
  text:setText("[voice:none]Ev[wait:40]en [wait:8.5]still [wait:37]I [wait:9]row [wait:10]a[wait:9]long. ")
  cutscene:wait(6.5)
  text:setText("[voice:none]My [wait:9]world [wait:40]is [wait:9]changed, \n[wait:40]and[wait:10] I,")
  cutscene:wait(5.9)
  text:setText("[voice:none]I [wait:2]don't [wait:2]mind, [wait:8]I've \n[wait:5]got [wait:2]my [wait:3]raft [wait:3]with [wait:2]me! ")
  cutscene:wait(7)
  text:setText("")


  cutscene:wait(2)
  
  img4:setScale(1) -- sets the scale of the sprite
  img4.physics.speed_x = 0.40 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.
  local x, y = cutscene:getMarker("cameratarget3")
  cutscene:panTo("cameratarget3", 13) --pan camera to marker named "camera_target" over 2 seconds
  cutscene:text("* Your destination is right up ahead.")
  cutscene:text("* Be careful,[wait:5] friend.")
  cutscene:text("* Fantasy is like water,[wait:5] swimming is safe but submerging yourself for too long is dangerous.")


  cutscene:wait(9)
  cutscene:playSound("noise2")
  kris:resetSprite()
  sailor:resetSprite()
  img4.physics.speed_x = 0.0 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

cutscene:wait(1)

end,



susieTest = function(cutscene)
  local susie = cutscene:getCharacter("susie")

  local img = Game.world.map:getImageLayer("overlay2")
  local alpha_fx = img:addFX(RecolorFX(), "AlphaFX")
  Game.world.timer:tween(0, alpha_fx, {color = {1, 1, 1, 0}})


  cutscene:setSpeaker(susie)
  cutscene:text("My name is Susie and this is a cutscene... (In the tune of The Mimic by XTRATUNA)", "blush")
  cutscene:text("Watch me summon this lighting with my mind!!!!", "teeth")

  Game.world.timer:tween(0.1, alpha_fx, {color = {1, 1, 1, 1}})
  cutscene:wait(1)
  cutscene:playSound("thunder")
  Game.world.timer:tween(0.7, alpha_fx, {color = {1, 1, 1, 0}})

  cutscene:wait(4)

  cutscene:text("Well Damn That Actually Worked", "blush")

  cutscene:wait(2)

  cutscene:playSound("noise")
  cutscene:fadeOut(0)
  local x, y = cutscene:getMarker("susie3")
  cutscene:slideTo(susie, x, y, 0.1)
  cutscene:wait(0.5)
  cutscene:playSound("noise")
  cutscene:fadeIn(0)

  cutscene:wait(1)
  cutscene:text("WHAT THE FUCK!!! WHO DID THAT!!", "teeth_b")
  
end,




december = function(cutscene)
  
  local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
  text.parallax_x = 0
  text.parallax_y = 0
  text.layer = WORLD_LAYERS["textbox"]
  Game.world:addChild(text)
  cutscene:fadeOut(3)
  
  text.alpha = 0
  local textWait = function() return text:isDone() end



  Game.world.timer:tween(3, text, { alpha = 1 })
  cutscene:wait(3)
  Assets.playSound("item")
  cutscene:wait(2)
 
  text:setText("[speed:0.5][color:#909090][voice:noelle]Hello.[wait:5] This is Noelle.[wait:5] A-again...")
  cutscene:wait(3)
  Game.world.music:play("noelle")
  Game.world.music:setLooping(false)
  cutscene:wait(3)
  text:setText("[speed:0.5][color:#909090][voice:noelle]At the time I'm recording this,[wait:5] I'm in the basement.")
  cutscene:wait(7)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I don't really know how to put this into words,[wait:5] but I've been missing you more recently.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I guess coming across the old Christmas card I made you certainly didn't help, haha[wait:5].[wait:5].[wait:5].")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]...")
  cutscene:wait(3.5)
  text:setText("[speed:0.5][color:#909090][voice:noelle]My friend and I are looking for Kris.[wait:10] They just...[wait:10] Vanished.[wait:10]\nAnd I'm really scared. ")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I-I'm scared that they'll be missing without a trace.[wait:10]")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]Missing...[wait:10]\nMissing,[wait:5] to the point where everyone in town has \nforgotten about them. ")
  cutscene:wait(11)
  text:setText("[speed:0.5][color:#909090][voice:noelle]And that,[wait:5]\nI-I'll feel like the only one\nwho remembers them...\n[wait:10]The only one who still cares to look. ")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]It's just,\n[wait:40][color:#494B48]Sigh... ")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]Every day I am reminded of you.[wait:10]\nBut every day I lose any bit of hope I'll see you again.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I probably sound pathetic saying all of this...\n[wait:10]I just,[wait:5] r-really hope you're \nokay.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I still like to believe \nyou're out there,[wait:5] safe.[wait:10]\nSomewhere,[wait:5] in this scary world.")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]On one of the adventures we used to go on together.")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]S-somewhere with pretty lights,[wait:5] somewhere you always wanted to take us.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]But sometimes,[wait:5] I swear-[wait:10]\nI'll see you.\n[wait:10]In the corner of my eye,\njust for a brief moment,")
  cutscene:wait(9)
  text:setText("[speed:0.5][color:#909090][voice:noelle]With that familiar smile,[wait:5]\nas if you never left my side...")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#494B48][voice:noelle]It's honestly terrifying...")
  cutscene:wait(6)
  Assets.playSound("dooropen")
  text:setText("[speed:0.5][color:#909090][voice:noelle]Terrifying,[wait:5] because I know it's not really you.[wait:10]\n[color:#494B48][shake:1]It never is.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]B-but even still,[wait:5] I try to stay hopeful.\n[wait:10]Hopeful I'll get to see you\nagain.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]That's what people know me for,[wait:5] anyways.")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]Well,\n[wait:5]I suppose I should probably go now.[wait:10]\nMy friend is waiting for me.")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I think you'd really like to \nmeet her.[wait:10]\nShe's wonderful really,[wait:5] but...")
  cutscene:wait(8)
  text:setText("[speed:0.5][color:#909090][voice:noelle]In the chance you're hearing \nthis,[wait:5] just know that-")
  cutscene:wait(6)
  text:setText("[speed:0.5][color:#909090][voice:noelle]I miss you,[wait:5] December.")
  cutscene:wait(6)
  text:setText("")
  cutscene:wait(1)
  Assets.playSound("wing")
  cutscene:wait(1)
  Assets.playSound("item")
  cutscene:wait(2)
  text:setText("[speed:0.5][color:#909090]Gosh.[wait:10] Who am I kidding...")
  cutscene:wait(2)
  Assets.playSound("wing")
  cutscene:wait(1)
  Assets.playSound("noise")
  cutscene:wait(6)
  
 
end,

testNoelle = function(cutscene)
  Game.world.camera:panTo("focus", 0.5)
  
  local flashlight = cutscene:getCharacter("flashlight")
  flashlight:setSprite("beam")
  local noelle = cutscene:getCharacter("noelle_lw")
  local susie = cutscene:getCharacter("susie")

  cutscene:text("My name is noelle and i am going to turn this flashlight on")
  noelle:setSprite("flashlight")
  Assets.playSound("noise")
 

  cutscene:text("Wow isn't this cool ok im turning it off now")
  flashlight:setSprite("off")
  noelle:resetSprite()



end,


knight = function(cutscene)

  

  local susie = cutscene:getCharacter("susie")
  
  local kris = cutscene:getCharacter("kris")
  local knight = cutscene:getCharacter("knight")
  cutscene:detachFollowers()

  local x, y = cutscene:getMarker("spawn")
  cutscene:slideTo(kris, x, y, 0.1)
  kris:setSprite("chair_1")
  cutscene:setSpeaker(knight)
  
  Game.world.camera:panTo("focus", 0.5)

  local x, y = cutscene:getMarker("offscreen")
  cutscene:slideTo(susie, x, y, 0.1)

  cutscene:wait(2)
  Game:setFlag("special_textbox", true)
  Game.world.music:play("knight")
  Game.world.music:setLooping(false)
  cutscene:text("[speed:0.7][spacing:4][style:GONER]* It's weird to think,[wait:0.5] isn't it?", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* All this time I've spent trying to capture you... ", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* Creating worlds that you'd never want to leave... ", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* That despite your insufferable persistence... ", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* All it took was for you to be vulnerable in the town square.", "stare")
  cutscene:wait(3)
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* You're [shake:1]PATHETIC,[shake:0][wait:5] Kris.", "stare")
  cutscene:text("[speed:0.7][spacing:1][style:GONER]* You do nothing but destroy my precious creations.", "stare")
  cutscene:text("[speed:0.7][spacing:1][style:GONER]* You have the audacity to mock me with your own.", "stare")
  cutscene:text("[speed:0.7][spacing:1][style:GONER]* ...", "stare")
  cutscene:text("[speed:0.7][spacing:1][style:GONER]* And you're helped by none other than my very own brother.", "stare")
  cutscene:text("[speed:0.7][spacing:0.5][style:GONER]* You have everything I ever wanted.", "stare")
  cutscene:text("[speed:0.7][spacing:0.5][style:GONER]* And you continue to take what's left of my own.", "stare")
  cutscene:text("[speed:0.7][spacing:0.5][style:GONER]* It's insulting.", "stare")
  cutscene:wait(1.5)
  --have the knight turn around here
  knight:setSprite("down")
  cutscene:wait(1.5)
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* I used to want to be just like you.", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* I thought you were everything I could've been.", "stare")
  cutscene:text("[speed:0.7][spacing:1][style:GONER]* But deep down,[wait:5] you know you're nothing without that stupid SOUL.", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* And now,[wait:5]\nI'm everything you can be and more.", "stare")
  cutscene:wait(1.5)
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* You are nothing.", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* You're [shake:1]DISPOSABLE.[shake:0]", "stare")
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* You're a [shake:1]REJECT.[shake:0]", "stare")
  cutscene:wait(2)
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* You're nothing but a failure,[wait:5] Kris.", "stare")
  cutscene:shakeCharacter("kris")
  Assets.playSound("bump")
  cutscene:wait(1)
  kris:setSprite("chair")
  kris.sprite:play(0.4)
  cutscene:wait(1.6)
  kris:setSprite("chair_4")
  
  Game:setFlag("special_textbox", false)
  local choice = cutscene:choicer({"They're not", "You're a failure"})
  Game:setFlag("special_textbox", true)
  cutscene:wait(0.5)
  cutscene:text("[speed:0.7][spacing:4][style:GONER][shake:1]* HA HA HA...[shake:0]", "stare")
  cutscene:text("[speed:0.7][spacing:4][style:GONER]* You speak for them.[wait:10] No wonder they're so helpless.", "stare")
  cutscene:wait(1.5)
  cutscene:text("[speed:0.7][spacing:4][style:GONER]* Hey [shake:1]FELINE.[shake:0]", "stare")
  
  
  cutscene:wait(2)
  cutscene:text("[speed:0.7][spacing:2][style:GONER]* Aren't you wondering how your friends are doing right now?", "stare")
  Game:setFlag("special_textbox", false)
  local choice = cutscene:choicer({"Wondering", "Don't care"})
  Game:setFlag("special_textbox", true)
  cutscene:text("[speed:0.7][spacing:4][style:GONER]* Good.[wait:10] Very good.", "stare")
  cutscene:text("[speed:0.7][spacing:4][style:GONER]* Now just close your eyes,[wait:5] and pretend...", "stare")
  Game:setFlag("special_textbox", false)

  Game.world.camera:panTo("focus2", 10)
  cutscene:fadeOut(7)

  cutscene:wait(2)
  kris:setSprite("chair_3")
  cutscene:wait(9999999)
  
end,

spriteTest = function(cutscene)
  local susie = cutscene:getCharacter("susie")
  susie:setSprite("hitting")
  susie.sprite:play(0.1)
  cutscene:wait(2)
  susie:setSprite("dork")
end,

waiting = function(cutscene)
  local susie = cutscene:getCharacter("susie")
  local noelle = cutscene:getCharacter("noelle")
  
  local img = Game.world.map:getImageLayer("overlay2")

  local alpha_fx = img:addFX(RecolorFX(), "AlphaFX")
  Game.world.timer:tween(0.1, alpha_fx, {color = {1, 1, 1, 0}})
  Game.world.camera:panTo("focus", 0.5)
  

  
 
  local x, y = cutscene:getMarker("susie1")
  cutscene:slideTo(susie, x, y, 0.1)
  cutscene:wait(0.5)
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 2, "right")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("susie1")
  cutscene:walkTo(susie, x, y, 2, "left")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 2, "right")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("susie1")
  cutscene:walkTo(susie, x, y, 2, "left")
  cutscene:wait(2)
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 2, "right")
  cutscene:wait(2)
  cutscene:setSpeaker(susie)
  cutscene:text("* Ughh...", "neutral_side")
  local x, y = cutscene:getMarker("susie1")
  cutscene:wait(1)
  cutscene:playSound("noise")
  Game.world.music:pause()
  cutscene:fadeOut(0)
  local x, y = cutscene:getMarker("susie2")
  
  cutscene:slideTo(susie, x, y, 0.1)
  
  cutscene:wait(1)
  susie:setSprite("chilling")
  cutscene:playSound("noise")
  Game.world.music:play()
  cutscene:fadeIn(0)
  cutscene:wait(4)
  cutscene:text("* U[wait:1]g[wait:1]h[wait:1]h[wait:1]h[wait:1]h[wait:1]h[wait:5].[wait:5].[wait:5].", "annoyed1")
  cutscene:wait(1)
  cutscene:playSound("noise")
  cutscene:fadeOut(0)
  Game.world.music:pause()
  local x, y = cutscene:getMarker("susie3")
  
  cutscene:slideTo(susie, x, y, 0.1)
  
  
  cutscene:wait(1)
  
  cutscene:playSound("noise")
  Game.world.music:play()
  cutscene:fadeIn(0)
  susie:setSprite("sit")
  cutscene:wait(2)
  susie.sprite:play(0.1)
  cutscene:playSound("wing")
  cutscene:wait(0.5) 
  cutscene:playSound("bump")
  cutscene:shakeCharacter(susie)
  susie:setSprite("sit_8")

  
  cutscene:wait(2)
  cutscene:text("* Power's out...[wait:10]\n* Noelle's taking forever...", "nervous")
  cutscene:text("* Kris is.[wait:10] Gone,[wait:5] or something.[wait:10] Jeez.", "nervous_side")
  cutscene:wait(2)
  cutscene:text("* We'll find you,[wait:5] dude.", "annoyed_down")
  cutscene:wait(1)
  
  Game.world.timer:tween(0.01, alpha_fx, {color = {1, 1, 1, 1}})
  cutscene:wait(0.5)
  cutscene:playSound("thunder")
  Game.world.timer:tween(0.7, alpha_fx, {color = {1, 1, 1, 0}})
  cutscene:wait(2)
  cutscene:text("* This is taking too long!!", "agitated")
  cutscene:wait(3)
  cutscene:shakeCharacter(susie)
  cutscene:playSound("bump")
  cutscene:wait(2)
  cutscene:text("* Noelleeee.[wait:5].[wait:5].[wait:5]\n* Help me up.[wait:5].[wait:5].", "stupid")
  cutscene:wait(2)
  cutscene:text("* Ugh.", "annoyed_down")


  cutscene:playSound("noise")
  Game.world.music:stop()
  cutscene:fadeOut(0)
  local x, y = cutscene:getMarker("susie4")
  
  cutscene:slideTo(susie, x, y, 0.1)
  
  
  cutscene:wait(2)
  
  cutscene:playSound("noise")
  Game.world.music:play()
  cutscene:fadeIn(0)
  susie:setSprite("chill")
  cutscene:wait(2)
  cutscene:text("* (What could possibly be taking her so long down there?)", "nervous")
  cutscene:wait(2)
  Game.world.timer:tween(0.01, alpha_fx, {color = {1, 1, 1, 1}})
  cutscene:wait(0.5)
  cutscene:playSound("thunder")
  Game.world.timer:tween(0.7, alpha_fx, {color = {1, 1, 1, 0}})
  cutscene:wait(1)
  susie:resetSprite()
  cutscene:playSound("wing")
  cutscene:text("* Alright,[wait:5] that's enough!![wait:10] I'm coming in there!!!", "teeth")
  cutscene:wait(0.5)
  
  local x, y = cutscene:getMarker("door")
  cutscene:walkTo(susie, x, y, 0.3, "right")
  cutscene:wait(0.5)
  susie:setSprite("hitting")
  susie.sprite:play(0.1)
  cutscene:playSound("bump")
  cutscene:wait(0.4) 
  cutscene:playSound("bump")
  cutscene:wait(0.1) 
  cutscene:playSound("phoneM")
  susie:resetSprite()
  cutscene:look(susie, "up")
  cutscene:wait(1)
  cutscene:playSound("phoneM")
  cutscene:wait(2)
  cutscene:text("* H-huh?[wait:10] What was that?", "surprise_frown")
  cutscene:wait(1)
  local x, y = cutscene:getMarker("door2")
  cutscene:walkTo(susie, x, y, 1, "up")
  cutscene:wait(1)
  susie:setSprite("dork")
  cutscene:gotoCutscene("depthsCutscenes.december")


  

end,

noelleTest = function(cutscene)
  
  
  Game.world:loadMap("noelles house/basement/basement")
  cutscene:fadeIn(3)
  
  

  local flashlight = cutscene:getCharacter("flashlight")
  
  local noelle = cutscene:getCharacter("noelle_lw")
  local susie = cutscene:getCharacter("susie")

  local x, y = cutscene:getMarker("susie1")
  
  cutscene:slideTo(susie, x, y, 0.1)
  Game.world.camera:panTo("focus", 0.5)

  cutscene:look(noelle, "left")
  cutscene:look(susie, "right")
  flashlight:setSprite("beam")
  noelle:setSprite("flashlight")
  cutscene:setSpeaker("susie")
  cutscene:wait(5)
  cutscene:text("* Uhhh...", "nervous_side")
  cutscene:text("* Are you like...", "nervous")


  cutscene:setSpeaker("noelle")
  cutscene:text("* ...", "what_smile")
  flashlight:setSprite("beamb")
  cutscene:text("* I found the flashlight...", "what_smile_b")

  cutscene:wait(1)
  Assets.playSound("noise")
  flashlight:setSprite("off")
  cutscene:wait(2)
  noelle:resetSprite()
  cutscene:text("* I-I'm sorry Susie,[wait:5] I just-", "sad_side", "noelle")
  cutscene:text("* Hey,[wait:5] it's okay.[wait:10] Do you want to like...", "sus_nervous", "susie")
  cutscene:text("* Talk about it,[wait:5] or something...?", "stupid", "susie")

  
  local x, y = cutscene:getMarker("noelle2")
  
  cutscene:walkTo(noelle, x, y, 1, "left")
  cutscene:text("* We can talk about it on the way to find Kris...", "sad_smile", "noelle")
  cutscene:text("* It's...[wait:10] A long story,[wait:5] I guess.", "sad_smile_b", "noelle")
  cutscene:wait(1)
  cutscene:look(noelle, "right")
  cutscene:wait(1)
  cutscene:text("* Let's go back upstairs,[wait:5] alright?", "sad_smile_b", "noelle")
  cutscene:wait(0.5)
  cutscene:look(noelle, "left")
  local x, y = cutscene:getMarker("noelle3")
  
  cutscene:walkTo(noelle, x, y, 2, "left")
  local x, y = cutscene:getMarker("susie2")
  
  cutscene:walkTo(susie, x, y, 1, "down")
  cutscene:wait(2)
  
  local x, y = cutscene:getMarker("noelle4")
  
  
  cutscene:walkTo(noelle, x, y, 2, "up")
  cutscene:wait(0.5)
  cutscene:look(susie, "left")
  cutscene:wait(1.5)
  noelle:setSprite("gough")
  cutscene:wait(1)
  cutscene:look(susie, "right")
  cutscene:wait(1)
  cutscene:text("* Noelle,[wait:5] you left your phone down here!!", "teeth", "susie")
  cutscene:wait(1.5)
  Assets.playSound("phone")
  cutscene:wait(0.5)
  Assets.playSound("phone")
  cutscene:wait(1.5)
  
  cutscene:text("* Uhhh...", "nervous", "susie")
  
  cutscene:wait(2)

  

end
}
