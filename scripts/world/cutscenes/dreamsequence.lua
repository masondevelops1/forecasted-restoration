return {

plaquecutscene = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local door = cutscene:getCharacter("door")
        if kris then
		
		cutscene:text("* You insert a key into the door.")
		cutscene:text("* It doesn't fit.")
		cutscene:text("* There's a note on the door that reads:")
		cutscene:text("* \"Locks are just for show! Please use padlock.\"")
		cutscene:wait(2)
		cutscene:text("* You punch in the characters found attached to the keys.")
		cutscene:wait(2)
		door:setSprite("door_open")
		cutscene:playSound("impact")
		cutscene:shakeCamera()
		end
  end,
  
  
  
krisWakeup = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local door = cutscene:getCharacter("door")
        if kris then
		cutscene:playSound("damage")
		cutscene:shakeCamera()
		kris:setSprite("fell")
		cutscene:wait(4)
		cutscene:playSound("bump")
		kris:resetSprite()
		end
  end,
  
  
krisSlide = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local x, y = cutscene:getMarker("kris_fall_1")
	 	
		cutscene:text("* You can't see the bottom.")
		cutscene:text("* Slide down?")
		local choice = cutscene:choicer({"Yes", "No"})
		cutscene:text("* You lose feeling in your limbs.")
		cutscene:wait(2)
		cutscene:playSound("rumble")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:wait(1)
		cutscene:playSound("rumble")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:wait(0.5)
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:playSound("rumble")
		kris:setSprite("trip")
		kris.sprite:play(0.4)
		cutscene:wait(0.5)
		
		
		kris:beginSlide()
		kris:setSprite("fall")
		kris.sprite:play(0.1, loop)
		cutscene:walkTo(kris, x, y, 15, "down")
		Game.world.timer:after(3, function()
		end)
  end,
  
  
  
dess = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local dess = cutscene:getCharacter("dess")
	
	 	
		cutscene:detachFollowers()
		
		cutscene:walkTo(kris, x, y, 15, "down")
		
		local x, y = cutscene:getMarker("kris1")
		cutscene:walkTo(kris, x, y + 20, 0.5, "right", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		kris:setSprite("fallen_1")
		end)
		
		local x, y = cutscene:getMarker("dess1")
		cutscene:walkTo(dess, x, y + 20, 0.5, "down", true)
		Game.world.timer:after(1, function()
		cutscene:playSound("wing")
		end)
		
		cutscene:wait(5)
		
		local x, y = cutscene:getMarker("dess2")
		cutscene:walkTo(dess, x, y + 20, 13, "down", true)
		Game.world.timer:after(1, function()
		end)
		cutscene:wait(14)
		
		cutscene:setSpeaker(dess)
		dess:setSprite("shock")
		cutscene:text("* Oh, Kris! There you are!", "shocked")
		cutscene:text("* Thought I'd never find you! Haha!", "smile")
		cutscene:text("* That was a pretty good spot, I'll give you that!", "sweat")
		dess:resetSprite()
		kris:setSprite("sitting")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:wait(2)
		cutscene:text("* Hey, don't look so smug!", "smug")
		cutscene:text("* You know you'll never beat my last spot, silly!", "smug")
		cutscene:wait(1)
		kris:resetSprite()
		cutscene:shakeCamera()
		cutscene:playSound("wing")
		cutscene:wait(2)
		cutscene:text("* Well let's get going then!", "smile")
		cutscene:text("* We can't let Noelle win this round, can we?", "determined")
		
		local x, y = cutscene:getMarker("dess3")
		cutscene:walkTo(dess, x, y + 20, 9, "right", true)
		Game.world.timer:after(1, function()
		end)
		
  end,
  
  
doorPushAway = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local dess = cutscene:getCharacter("dess")
	 local noelle = cutscene:getCharacter("noelle")
        if kris then
		cutscene:text("* You reach for the door.")
		cutscene:text("* Open it?")
		local choice = cutscene:choicer({"Yes", "No"})
		cutscene:text("* It won't budge.")
		cutscene:text("* You regain feeling in your limbs.")
		cutscene:wait(2)
		cutscene:text("* Try again?")
		local choice = cutscene:choicer({"Yes", "No"})
		cutscene:shakeCamera()
		kris:setSprite("fallen_1")
		cutscene:playSound("damage")
		cutscene:playSound("dtrans_flip")
		
		local x, y = cutscene:getMarker("slide")
		cutscene:walkTo(kris, x, y, 1, "down")
		
		cutscene:wait(1)
		cutscene:text("* Your heartbeat quickened.")
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		kris:setSprite("fallen_2")
		cutscene:wait(1)
		kris:setSprite("fallen_3")
		cutscene:shakeCamera()
		cutscene:playSound("bump")
		cutscene:text("* You grasped at nothing.")
		cutscene:playSound("damage")
		cutscene:shakeCamera()
		kris:setSprite("fallen_1")
		cutscene:wait(2)
		cutscene:text("* Your eyesight became blurry.")
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		kris:setSprite("fallen_2")
		cutscene:wait(2)
		cutscene:text("* Your voice echoes aimlessly.")
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(1)
		kris:setSprite("fallen_3")
		cutscene:text("* An emptiness filled your hands.")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		kris:setSprite("fallen_1")
		cutscene:playSound("damage")
		cutscene:playSound("damage")
		cutscene:shakeCamera()
		cutscene:text("* It could not be.")
		cutscene:wait(3)
		cutscene:text("* Kris...")
		
		cutscene:wait(2)
		cutscene:setSpeaker(dess)
		cutscene:text("* Kris...!")
		kris:setSprite("fallen_2")
		cutscene:wait(1)
		cutscene:setSpeaker(noelle)
		cutscene:text("* C-can you hear me?")
		kris:setSprite("fallen_3")
		
		
		
		cutscene:shakeCamera()
		
		
		end
  end,
  
  
  
flashback = function(cutscene)

Kristal.Console:log("test")
	
	 local kris = cutscene:getCharacter("kris")
	 local asriel = cutscene:getCharacter("asriel")
	 local dess = cutscene:getCharacter("dess")
	 local noelle = cutscene:getCharacter("noelle")
        if kris then
		cutscene:detachFollowers()
		local x, y = cutscene:getMarker("kris1")
		cutscene:walkTo(kris, x, y, 5, "left")
		
		local x, y = cutscene:getMarker("dess1")
		cutscene:walkTo(dess, x, y, 5, "down")
		
		local x, y = cutscene:getMarker("azzy1")
		cutscene:walkTo(asriel, x, y, 5, "down")
		
		local x, y = cutscene:getMarker("noelle1")
		cutscene:walkTo(noelle, x, y, 5, "right")
		
		cutscene:wait(5)
		
		dess:setSprite("shock")
		kris:setSprite("fallen_2")
		cutscene:wait(2)
		cutscene:shakeCharacter("kris")
		cutscene:playSound("bump")
		cutscene:wait(3)
		kris:setSprite("fallen_3")
		cutscene:shakeCharacter("kris")
		cutscene:playSound("bump")
		cutscene:wait(1)
		cutscene:setSpeaker(noelle)
		cutscene:text("* Kris!!", "baby_frown")
		cutscene:wait(2)
		cutscene:playSound("wing")
		kris:setSprite("kris_zombie")
		cutscene:wait(2)
		cutscene:setSpeaker(asriel)
		cutscene:text("* Gosh, you're finally up!", "neutral_smile")
		cutscene:setSpeaker(noelle)
		cutscene:text("* Kris! Are you okay!?", "baby_frown")
		cutscene:text("* I-I was so worried about you!", "baby_frown")
		cutscene:text("* You've been on the floor for so long!", "baby_frown")
		cutscene:setSpeaker(asriel)
		cutscene:text("* Oh, it wasn't that long. Kris is a trooper!", "neutral_smile" )
		cutscene:text("* Nothing an ol' Dreemur can't handle!-", "smile", {auto = true})
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(2)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(2)
		cutscene:setSpeaker(noelle)
		cutscene:text("* Kris, what's going on!", "baby_frown")
		cutscene:playSound("bump")
		cutscene:shakeCharacter("kris")
		cutscene:shakeCamera()
		cutscene:wait(2)
		cutscene:setSpeaker(dess)
		cutscene:text("* Kris, is everything alright? Do you want me to call Toriel-", "shocked", {auto = true})
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCamera()
		cutscene:shakeCharacter("kris")
		cutscene:wait(0.5)
		cutscene:playSound("bump")
		cutscene:shakeCharacter("kris")
		cutscene:shakeCamera()
		cutscene:wait(0.5)
		cutscene:wait(0.5)
		kris:setSprite("scare")
		kris.sprite:play(0.1)
		noelle:setSprite("shock")
		noelle.sprite:play(0.1)
		cutscene:wait(0.7)
		noelle:setSprite("shock_6")
		kris:setSprite("scare_10")
		cutscene:wait(1)
		cutscene:setSpeaker(noelle)
		cutscene:text("* ...", "baby_frown")
		cutscene:setSpeaker(dess)
		cutscene:text("* Noelle, wait!", "concern")
		cutscene:setSpeaker(noelle)
		cutscene:text("* I- I...", "baby_tearing")
		cutscene:setSpeaker(dess)
		cutscene:text("* Noelle! It's alright Kris is okay!", "shocked")
		cutscene:wait(1)
		cutscene:playSound("wing")
		cutscene:shakeCamera()
		noelle:setSprite("cry")
		dess:setSprite("displeased")
		noelle.sprite:play(1)
		cutscene:setSpeaker(noelle)
		cutscene:text("* I-I THOUGHT KRIS WAS-", "baby_sobbing")
		cutscene:setSpeaker(dess)
		cutscene:text("* I know, I know honey. They're just fine!", "shocked")
		cutscene:text("* ...", "displeased")
		cutscene:text("* Kris! That's not funny at all!", "pissed")
		cutscene:text("* You know she gets scared easily!", "pissed")
		cutscene:setSpeaker(asriel)
		cutscene:text("* Hey, it was just a silly prank.", "snicker")
		cutscene:text("* I thought it was a little bit funny!", "snicker")
		cutscene:setSpeaker(dess)
		cutscene:text("* Ugh, it wasn't!", "smug")
		cutscene:text("* Y'know what? Give me that!", "angry_smirk")
		dess:setSprite("right_1")
		cutscene:wait(1)
		cutscene:shakeCamera()
		cutscene:playSound("wing")
		asriel:setSprite("blush")
		cutscene:setSpeaker(asriel)
		cutscene:text("* H-Hey, my jacket!", "flushed")
		cutscene:wait(0.5)
		dess:resetSprite()
		local x, y = cutscene:getMarker("dess2")
		cutscene:walkTo(dess, x, y, 1, "left")
		cutscene:wait(1)
		
		local x, y = cutscene:getMarker("dess3")
		cutscene:walkTo(dess, x, y, 1, "down")
		cutscene:wait(1)
		local x, y = cutscene:getMarker("dess4")
		cutscene:walkTo(dess, x, y, 1, "right")
		cutscene:wait(1)
		dess:setSprite("up_1")
		asriel:setSprite("down_jacketless_1")
		cutscene:setSpeaker(dess)
		dess:setSprite("wipe")
		dess.sprite:play(0.5)
		cutscene:wait(2)
		cutscene:setSpeaker(asriel)
		cutscene:text("* Sorry...", "flushed")
		cutscene:wait(1)
		cutscene:setSpeaker(dess)
		cutscene:text("* There there Noelle. It'll be okay.", "endearing")
		cutscene:wait(2)
		cutscene:setSpeaker(noelle)
		cutscene:text("* T-Thanks Dess...", "baby_tearing")
		cutscene:text("* I thought Kris was hurt! I was so worried!", "baby_tearing")
		cutscene:setSpeaker(dess)
		cutscene:text("* I know honey. Everything's alright.", "endearing")
		cutscene:wait(2)
		cutscene:text("* Kris! Apologize this instant!", "pissed")
		noelle:resetSprite()
		kris:setSprite("headshake")
		kris.sprite:play(0.5)
		cutscene:wait(2)
		cutscene:text("* Kris. Don't make me call Toriel.", "smug")
		cutscene:wait(2)
		kris:setSprite("tounge")
		kris.sprite:play(0.5)
		cutscene:wait(1)
		kris:resetSprite()
		local x, y = cutscene:getMarker("runaway")
		cutscene:walkTo(kris, x, y, 2, "right")
		cutscene:wait(1)
		cutscene:text("* Hey, you get back here!", "shocked")
		dess:resetSprite()
		cutscene:walkTo(dess, x, y, 2, "right")
		asriel:setSprite("right_jacketless_1")
		cutscene:wait(2)
		cutscene:setSpeaker(noelle)
		cutscene:text("* Get 'em, Dess!", "baby_neutral")
		cutscene:walkTo(noelle, x, y, 2, "right")
		cutscene:wait(2)
		cutscene:setSpeaker(asriel)
		cutscene:text("* W-Wait up guys!", "neutral_talking")
		asriel:setSprite("right_jacketless")
		asriel.sprite:play(0.2)
		cutscene:walkTo(asriel, x, y, 2, "right")
		cutscene:wait(5)
		cutscene:fadeOut(0)
		end
  end,
  
  

  
finale = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local asriel = cutscene:getCharacter("asriel")
	 local dess = cutscene:getCharacter("dess")
	 
	 local img = Game.world.map:getImageLayer("night")
	 local img1 = Game.world.map:getImageLayer("door")
	 local img2 = Game.world.map:getImageLayer("overlay")
	 img2.visible = true
	 cutscene:detachFollowers()
		 if kris then
		 cutscene:setSpeaker(dess)
		 
		 local x, y = cutscene:getMarker("dessoutside")
		 cutscene:walkTo(dess, x, y, 1, "up")
		 
		 local x, y = cutscene:getMarker("krisoutside")
		 cutscene:walkTo(kris, x, y, 1, "up")
		 
		 
		 cutscene:wait(5)
		 
		 local x, y = cutscene:getMarker("dessdoor")
		 cutscene:walkTo(dess, x, y, 15, "up")
		 cutscene:wait(0.3)
		 
		 local x, y = cutscene:getMarker("krisdoor")
		 cutscene:walkTo(kris, x, y, 15, "up")
		 
		 cutscene:wait(9)
		 
		 cutscene:text("* Well Kris, today was fun wasn't it?", "smile")
		 cutscene:text("* I'm glad you ended up hanging out with Noelle.", "smile")
		 cutscene:text("* Thanks for that. She's been a little sad recently, y'know?", "endearing")
		 cutscene:look("dess", "right")
		 cutscene:text("* Worried about our families growing apart and stuff.", "disappointed")
		 cutscene:text("* She's far too young to have to worry about that.", "endearing")
		 cutscene:text("* I'll take her to see the world before that point!", "determined")
		 cutscene:text("* To a city with bright lights far from home! Wouldn't that be nice?", "determined")
		 cutscene:text("* Even if Mom would never let that happen...", "sweat")
		 cutscene:text("* ...", "disappointed")
		 cutscene:text("* Anyways, Azzy just left to go to the store.", "smile")
		 cutscene:text("* I really should catch up with him. Don't want to leave him waiting!", "determined")
		 cutscene:text("* See ya Kris!", "glitch")
		 kris:setSprite("pensive_left")
		 cutscene:shakeCharacter("kris")
		 cutscene:playSound("bump")
		 
		 local x, y = cutscene:getMarker("dessvoid")
		 cutscene:walkTo(dess, x, y, 6, "up")
		 
		 cutscene:wait(5)
		 cutscene:playSound("rudehit")
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCamera()
		 img.visible = false
		 
		 cutscene:wait(3)
		 cutscene:look("dess", "up")
		 
		 cutscene:wait(3)
		 
		 cutscene:text("* Kris, you know this isn't normal.", "disappointed")
		 cutscene:text("* I- I'm...", "pensive")
		 cutscene:text("* I'm here for a reason, arent I?", "endearing")
		 cutscene:wait(2)
		 cutscene:text("* There's something I have to tell you.", "pensive")
		 cutscene:text("* Something is under Hometown.", "concern")
		 cutscene:text("* A-And I can feel it growing stronger every day.", "distress")
		 cutscene:text("* I don't know what it is.", "distress")
		 cutscene:text("* But it can't be long before it's too late.", "disappointed")
		 cutscene:wait(2)
		 cutscene:text("* But there's one thing I do know.", "pissed")
		 cutscene:text("* She's still out there. ", "pissed")
		 cutscene:text("* I-I am still out there.", "pissed")
		 cutscene:text("* I don't know where, but...", "disappointed")
		 cutscene:text("* She felt closer to you today than she has in years.", "smile_shocked")
		 cutscene:text("* I'm not sure why.", "smile")
		 cutscene:text("* But, Kris...", "disappointed")
		 
		  
		 local x, y = cutscene:getMarker("desshug")
		 cutscene:walkTo(dess, x, y, 5, "up")
		 cutscene:wait(2)
		 
		 
		 cutscene:wait(3)
		 
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCamera()
		 kris:setSprite("sit_left")
		 cutscene:playSound("bump")
		 cutscene:text("* You know this isn't healthy.", "disappointed")
		 cutscene:text("* Your refusal to wake up.", "disappointed")
		 cutscene:text("* I know it's nice reliving old times.", "endearing")
		 cutscene:text("* But you know that's not why I'm here right now.", "disappointed")
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text("* ...", "kris/shaded_neutral")
		 cutscene:shakeCharacter("kris")
		 cutscene:playSound("bump")
		 cutscene:text("* ...", "kris/shaded_crying")
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text("* Kris, you have to-", "disappointed", {auto = true})
		 
		 cutscene:setSpeaker("kris")
		 cutscene:playSound("rudehit")
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCharacter("dess")
		 cutscene:shakeCamera()
		 cutscene:text("* I-I CAN'T!", "kris/shaded_agony")
		
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text("* ...!", "shocked")
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text("* I can't go back.", "kris/shaded_agony")
		 cutscene:text("* Not like this.", "kris/shaded_crying")
		 cutscene:text("* How'd Susie feel if she saw me like this-", "kris/shaded_crying", {auto = true})
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text("* She would completely understand, Kris.", "endearing")
		 cutscene:text("* You know she loves you.", "endearing")
		 cutscene:text("* ...", "disappointed")
		 cutscene:text("* Kris, I know things aren't the way they once were.", "disappointed")
		 cutscene:text("* But, if the real me were there with you right now...", "endearing")
		 cutscene:text("* I'd... She'd be so proud of you, Kris!", "determined")
		 cutscene:text("* You've been making so many friends, helping so many people!", "smile")
		 cutscene:text("* But you can't stay here with me. ", "disappointed")
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text("* ...", "kris/shaded_crying")
		 cutscene:text("* ...", "kris/shaded_neutral")
		 
		 cutscene:setSpeaker("dess")
		 cutscene:text("* It'll be okay, Kris.", "disappointed")
		 cutscene:text("* I promise.", "endearing")
		 cutscene:wait(2)
		 cutscene:text("* I think it's time for you to go.", "smug")
		 cutscene:wait(2)
		 
		 img1.visible = false
		 img2.visible = true
		 cutscene:playSound("impact")
		 cutscene:shakeCharacter("kris")
		 cutscene:shakeCharacter("dess")
		 cutscene:shakeCamera()
		 cutscene:wait(2)
		 
		 dess:setSprite("hug")
		 dess.sprite:play(0.5)
		 cutscene:wait(0.6)
		 dess:setSprite("hug3")
		 
		 cutscene:wait(4)
		 
		 cutscene:setSpeaker("kris")
		 cutscene:text("* ...", "kris/crying")
		 cutscene:text("* Thank you, December.", "kris/crying")
		 cutscene:wait(2)
		 
		 dess:setSprite("vanish")
		 dess.sprite:play(0.5)
		 cutscene:wait(5.6)
		 dess:setSprite("vanishaaaa")
		 local x, y = cutscene:getMarker("dessoutside")
		 cutscene:walkTo(dess, x, y, 1, "up")
		 kris:resetSprite()
		 
		end
  end,
  
  
exit = function(cutscene)

Kristal.Console:log("test")
	 local kris = cutscene:getCharacter("kris")
	 local asriel = cutscene:getCharacter("asriel")
	 local dess = cutscene:getCharacter("dess")
	  if kris then
	  
		cutscene:fadeOut(0)
		local text = cutscene:text("HELLO",   {style="GONER"})
		text.box.visible = false
		cutscene:text("* ARE WE YET AGAIN",  {style="GONER"})
		
		
		cutscene:wait(15)
		end
  end,
 

 

goner = function (cutscene)

        local text

        local function gonerTextFade(wait)
            local this_text = text
            Game.world.timer:tween(1, this_text, { alpha = 0 }, "linear", function ()
                this_text:remove()
            end)
            if wait ~= false then
                cutscene:wait(1)
            end
        end

        local function gonerText(str, advance)
            text = DialogueText("[speed:0.5][spacing:6][style:GONER][voice:none]" .. str, 160, 100, 640, 480,
                                { auto_size = true } )
            text.layer = WORLD_LAYERS["top"] + 100
            text.skip_speed = true
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:addChild(text)

            if advance ~= false then
                cutscene:wait(function () return not text:isTyping() end)
                gonerTextFade(true)
            end
        end

        cutscene:fadeOut(0.5, { music = true })
		
		cutscene:wait(1)
		
		local drone = Assets.playSound("AUDIO_DRONE")
		drone:setLooping(true)


		local background = GonerBackground()
		
        background.layer = WORLD_LAYERS["top"]
        Game.world:addChild(background)
		background.alpha = 0
		background:fadeTo(1, 2)

        gonerText("ARE WE ONCE AGAIN[wait:40]\nCONNECTED? [wait:80]")
		
		gonerText("IS OUR CONNECTION[wait:80]\nESTABLISHED? [wait:120]")
		
		gonerText("IT HAS BEEN[wait:80]\nQUITE SOME TIME. [wait:160]")
		gonerText("BUT AS I SEE IT [wait:160]")
		

		local soul = SoulAppearance(300, 540)
        soul.layer = WORLD_LAYERS["top"] + 100
        Game.world:addChild(soul)
        cutscene:wait(3)

		gonerText("YOU ARE READY[wait:80]\n TO KNOW THE TRUTH. [wait:160]")
		

		background.visible = false
		cutscene:wait(2)
		
        cutscene:text("I anticipate\nyour arrival. [wait:160]")
		
    end,
	
	}