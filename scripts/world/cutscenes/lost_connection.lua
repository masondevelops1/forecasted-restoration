return {

    ---@param cutscene WorldCutscene
    krisSlip = function(cutscene)
        if Plot:isBefore("depths_slip") then
            Game.world.music:fade(0, 1)
            Game:setBorder("simple")
            local kris = cutscene:getCharacter("kris")
            local susie = cutscene:getCharacter("susie")
            local sound = Assets.newSound("noise")
            sound:play()
            cutscene:text("* You began to stop feeling your limbs...[wait:5] You quickly pulled out the small device.")
            Game.stage:addChild(ConnectionPopupFaulty())
            cutscene:wait(6.2)
            cutscene:detachFollowers()
            Assets.playSound("locker")
            cutscene:fadeOut(0.0001, { music = true })
            cutscene:text("* You began to stop being able to see...[wait:40] You began to stop being able to hear...")
            local x, y = cutscene:getMarker("krisfallen")
            cutscene:walkTo(kris, x, y, 1, "up")
            kris:setSprite("grab")
            cutscene:wait(2)
            local x, y = cutscene:getMarker("susie1")
            cutscene:walkTo(susie, x, y, 1, "up")
            susie:setSprite("grab")
            cutscene:text("* But eventually...[wait:5] you started to hear something again...")
            cutscene:wait(2)
            --start gonerText
            local text

            local skip_hint = true


            local function gonerTextFade(wait)
                local this_text = text
                Game.world.timer:tween(1, this_text, { alpha = 0 }, "linear", function()
                    this_text:remove()
                end)
                if wait ~= false then
                    cutscene:wait(1)
                end
            end

            -- FIXME: actually use skippable
            local function gonerText(str, advance, skippable)
                text = DialogueText("[speed:0.5][spacing:6][style:GONER][voice:none]" .. str, 160, 100, 640, 480,
                    { auto_size = true })
                text.layer = WORLD_LAYERS["top"]
                text.skip_speed = not skippable
                text.parallax_x = 0
                text.parallax_y = 0
                Game.world:addChild(text)

                if advance ~= false then
                    cutscene:wait(function() return not text:isTyping() end)
                    gonerTextFade(true)
                end
            end

            ---@type Music -- satisfy LLS
            local world_music = Game.world.music
            world_music:play("AUDIO_DRONE", 0.8)
            gonerText("HELLO?[wait:60]")
            gonerText("ARE YOU[wait:40]\nTHERE?[wait:60]")
            gonerText("IS OUR CONNECTION[wait:40]\nPROPER?[wait:60]")
            gonerText("EXCELLENT.[wait:60]")
            cutscene:wait(1)
            sound:play()
            local background = GonerBackground(nil, nil, "AUDIO_DRONE", true, world_music)
            background.layer = WORLD_LAYERS["textbox"]
            Game.world:addChild(background)
            local soul = SoulAppearance(SCREEN_WIDTH / 2 - 25, SCREEN_HEIGHT / 2 + 20)
            soul:setParallax(0, 0)
            soul.layer = WORLD_LAYERS["above_textbox"]
            --soul.alpha = 50
            --soul.graphics.fade = 0.01
            --soul.graphics.fade_to = 1
            local soul_movement = true
            cutscene:during(function()
                if soul_movement == true then
                    soul.y = SCREEN_HEIGHT / 2 + 20 + math.sin(Kristal.getTime() * 2) * 6
                end
            end)
            Game.world:addChild(soul)
            cutscene:wait(1.75)
            gonerText("YOUR SOUL...[wait:40]\nIT IS GETTING WEAKER.\n[wait:60]")
            cutscene:wait(0.5)
            gonerText("WE ARE LOSING[wait:40]\nCONNECTION...[wait:60]")
            cutscene:wait(0.5)
            soul:hide()
            cutscene:wait(2.5)
            gonerText("THEIR MOTIVATION...[wait:60]\nIT IS BLEAK.[wait:60]")
            cutscene:wait(0.5)
            gonerText("AND NOW...[wait:60]")
            cutscene:wait(0.5)
            gonerText("NOW THIS WORLD'S TIME[wait:40]\nIS RUNNING VERY LOW.[wait:60]")
            cutscene:wait(1.5)
            gonerText("BUT AS I SEE IT...[wait:60]")
            gonerText("THESE \"HEROES...\"[wait:60]")
            gonerText("THEIR LIGHT SHINES\nBRIGHTER THAN MOST.[wait:60]")
            cutscene:wait(1.5)
            gonerText("...[wait:20]")
            gonerText("YOU MUST NOT LET THEM\nLOSE HOPE.[wait:60]")
            gonerText("THEIR LIGHT MUST\nCONTINUE TO SHINE\nBRIGHTER...[wait:60]")
            cutscene:wait(1.5)
            sound:play()
            background:remove()
            cutscene:wait(0.5)
            gonerText("RISE UP...[wait:60]")
            cutscene:wait(3)
            Assets.playSound("noise")
            world_music:stop()
            cutscene:wait(1)
            gonerText("RISE UP[wait:40]\nAS THEY CALL YOUR\nNAME...[wait:20]")
            Game.world.music:fade(0, 1)
            --end gonerText
            Assets.playSound("locker")
            Game.world.music:play("depths")
            Game:setBorder("ground_zero")
            cutscene:fadeIn(0.1, { music = true })
            cutscene:shakeCharacter("kris")
            cutscene:playSound("bump")
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
            Game.stage:addChild(ConnectionPopup())
            SetPlot("depths_slip")
        end;
    end;
}