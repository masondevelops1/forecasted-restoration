---@type table<string, fun(cutscene:WorldCutscene, event:Script|NPC):...>
local act3npcs = {
    -- Use with `local victory = cutscene:gotoCutscene("boat/act3npcs.ponggame")` in another cutscene.
    ponggame = function (cutscene)
        local world = cutscene.world
        world.camera.keep_in_bounds = false
        world.camera:setAttached(false,false)
        local boatsprite = Sprite("objects/pongMinigame/playerHit")
        boatsprite:setScale(32)
        boatsprite:setPosition(-344,-200)
        boatsprite.origin_x = 0.5
        Game.world:spawnObject(boatsprite, WORLD_LAYERS["above_events"])
        boatsprite.alpha = 0
        local done = false
        local cam_x, cam_y = world.camera:getPosition()
        world.timer:tween(4, world.camera, {zoom_x = 1/16, zoom_y = 1/16}, "out-quad")
        world.timer:tween(4, world.camera, {x = -3780, y = 1083}, "in-quart", function ()
            done = true
            cutscene:tryResume()
        end)
        boatsprite:fadeTo(1,4)
        cutscene:wait(function () return done end)
        local layers = Utils.filter(world.map.tile_layers, function (v) return v.visible end)
        local events = Utils.filter(world.map.events, function (v) return v.visible end)
        for _, layer in ipairs(layers) do
            layer.visible = false
        end
        for _, event in ipairs(events) do
            event.visible = false
        end
        world.player.visible = false
        for _, chara in ipairs(world.followers) do
            chara.visible = false
        end
        Mod.shared_gonerbg.visible = true

        boatsprite.visible = false
        local minigame = Game.stage:addChild(PongMinigame())
        local victory = minigame:await(cutscene)
        boatsprite.visible = true
        boatsprite:fadeOutAndRemove(4)
        for _, layer in ipairs(layers) do
            layer.visible = true
        end
        for _, event in ipairs(events) do
            event.visible = true
        end
        for _, chara in ipairs(world.followers) do
            chara.visible = true
        end
        world.player.visible = true
        minigame:remove()

        done = false
        world.timer:tween(4, world.camera, {zoom_x = 1, zoom_y = 1}, "in-quad")
        world.timer:tween(4, world.camera, {x = cam_x, y = cam_y }, "out-quart", function ()
            done = true
            cutscene:tryResume()
        end)
        cutscene:wait(function () return done end)
        world.camera:setAttached(true)
        world.camera.keep_in_bounds = true
        return victory
    end,

    pongStart = function(cutscene, event)
        if Plot:isAfter("boat_end") then
            cutscene:setSpeaker("susie")
            cutscene:text("* I think it's time to get off the boat,[wait:5] Kris.")
            return
        end
        local susie = cutscene:getCharacter("susie")
        cutscene:setSpeaker("susie")
        cutscene:detachFollowers()
        cutscene:text("* Okay Kris...", "smirk")
        cutscene:text("* Let's deal with these pirates once and for all.", "smile")
        cutscene:text("* You man the steering,[wait:5] and I'll man the paddles!", "smile")
        cutscene:text("* LET'S DO THIS!!!", "teeth_b")
        local susx, susy = susie:getPosition()
        cutscene:walkTo(susie, "susie1", 1, "left")
        cutscene:wait(1)
        cutscene:walkTo(susie, "susie2", 2, "up")
        cutscene:wait(2)
        cutscene:look(susie, "left")
        cutscene:gotoCutscene("boatCutscenes.ponggame")
        Plot:set(PLOT.boat_end)
        cutscene:wait(cutscene:walkTo(susie, "susie1", 2, "down"))
        cutscene:wait(cutscene:walkTo(susie, susx, susy, 1, "right"))
        cutscene:wait(cutscene:attachFollowers())
        cutscene:gotoCutscene("boatCutscenes.pongFinish")
        
    end,


    pongFinish = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:setSpeaker("susie")
        cutscene:text("* Hell yeah![wait:5] We showed em' who's boss!", "smirk")
        cutscene:text("* Guess that's the end of that mystery.", "stupid")
        cutscene:text("* Good work,[wait:5] \"detective.\"", "smirk")
        cutscene:text("* Let's just go back to our room and chill.", "nervous_side")
        cutscene:text("* We can't be THAT far from those Evergroves!", "sincere_smile")
        cutscene:wait(cutscene:fadeOut(1.5, { music = true }))
        Game:getPartyMember("kris"):setFlag("cool_hat", false)
        cutscene:mapTransition("boat/suite", 540, 228)
        cutscene:wait(5)
        Assets.playSound("intercom_on")
        cutscene:setSpeaker()
        cutscene:wait(2)
        cutscene:text([=[
[miniface:speaker]Hello,[wait:5] It's ye Captain speakin' again!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]For anybody who's still on
me ship,[wait:5] this is your final wake-up call!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]It's me advision to get 
off the boat,[wait:5] as we've reached 
our stop,[wait:5] The Evergroves!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]Toodles![wait:5] Hope you had a nice 
stay on the Evergroves Cruise!
        ]=], some_args)
        Assets.playSound("intercom_off")
        cutscene:wait(2)
        cutscene:wait(cutscene:fadeIn(1.5, { music = true }))
        cutscene:setSpeaker("susie")
        cutscene:text("* Dang,[wait:5] guess we really overslept,[wait:5] huh...?", "suspicious")
        cutscene:text("* Now's the time we get off the boat,[wait:5] can't even say goodbye either...", "nervous")
        cutscene:text("* ... well,[wait:5] let's get going!", "smile")
        Game:getQuest("mystery"):complete()
    end,

    stain = function(cutscene, event)
        cutscene:text("* (It's an oil stain.)")
        cutscene:text("* (A notably smaller oil stain,[wait:5] but a stain nonetheless.)")
        cutscene:text("* (It seems they couldn't clear it out.)")
    end,


    oilLicker1 = function(cutscene, event)
        local oilLicker = cutscene:getCharacter("boatnpcs/oilLicker")
        -- oilLicker.sprite:play(0.04, loop)
    end,

    fridge = function(cutscene, event)
        if not Plot:between("boat_act3_mapswitch", "boat_end") then
            cutscene:text("* (It's a fridge.)")
            cutscene:text("* (The urge to open the fridge is strong,[wait:5] but you must resist.)")
        else
            cutscene:text("* (There are several cans of \"pickled pong balls\" in the fridge.)")
            cutscene:text("* (Without hesitation,[wait:5] you grab 3 of them.)")
            Game:setFlag("foodGrabbed", true)
        end
    end,


    chatter = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:text("* Well,[wait:5] this is all fine and dandy,[wait:5] Cap'n!")
        cutscene:text("* But how are we gonnuh get dis back on the ship??")
        cutscene:text("* WELL HOW 'BOUT WE THROW IT IN THE WATER AND SEE IF IT SWIMS? HA[wait:5] HA!")
        cutscene:text("* Keep yer voice down,[wait:5] scallywag![wait:10] Someone could hear!")
        cutscene:setSpeaker("susie")
        cutscene:look(susie, "up")
        cutscene:text("* What the hell was that??", "surprise")
        cutscene:look(susie, "left")
        cutscene:text("* We really gotta find a key to that room...", "smirk")
        
    end,

    boilerHit = function(cutscene, event)
        cutscene:detachFollowers()
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 3, "up")
        local x, y = cutscene:getMarker("kris1")
        cutscene:walkTo(kris, x, y, 3, "up")
        cutscene:setSpeaker("susie")
        cutscene:wait(4)
        cutscene:text("* The boiler...", "nervous")
        cutscene:text("* It's completely covered in oil. ", "suspicious")
        cutscene:text("* ...", "neutral_side")
        cutscene:text("* ALRIGHT,[wait:5] I'VE HAD ENOUGH OF THIS CRAP!!", "teeth")
        cutscene:text("* WHO'S IN THERE?!?", "teeth_b")
        susie:setSprite("shock_up")
        local x, y = cutscene:getMarker("susieHit")
        cutscene:shakeCharacter("susie")
        cutscene:slideTo(susie, x, y, 0.1)
        Assets.playSound("locker")
        cutscene:wait(0.2)
        local x, y = cutscene:getMarker("susie1")
        cutscene:slideTo(susie, x, y, 0.1)
        cutscene:wait(0.2)
        susie:resetSprite()
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:wait(0.5)
        cutscene:text("* Huh?[wait:10] What is that???", "surprise")
        cutscene:shakeCharacter("susie")
        susie:setSprite("shock_behind")
        Assets.playSound("wing")
        cutscene:text("* It's...[wait:10] A key...?", "suspicious")
        susie:resetSprite()
        cutscene:look(susie, "right")
        cutscene:wait(0.2)
        cutscene:look(susie, "down")
        cutscene:wait(0.2)
        cutscene:look(susie, "left")
        cutscene:wait(0.2)
        cutscene:text("* Well there's like one place I can think of to try it.[wait:10] Let's go,[wait:5] Kris!", "smile")
        cutscene:setSpeaker(nil)
        cutscene:gotoCutscene("boatCutscenes.getKey101")
        cutscene:attachFollowers()

        
    end,

    scientist2 = function(cutscene, event)
        local kris = assert(cutscene:getCharacter("kris"), "no kris???")
        local susie = cutscene:getCharacter("susie")
        local scientist = cutscene:getCharacter("boatnpcs/scientist")
        if not Game:getFlag("foodGrabbed") and event.interact_count == 1 then
            cutscene:setSpeaker("susie")
            cutscene:text("* NOT THIS GUY AGAIN.", "teeth")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Greetings.[wait:10] Now that the Scrapscallions are gone...", nil, scientist)
            cutscene:text("* I can sufficiently operate in the boiler room.", nil, scientist)
            cutscene:text("* Your work was...", nil, scientist)
            cutscene:text("* Decent.", nil, scientist)
            cutscene:text("* I guess.", nil, scientist)
            -- susie look around
            cutscene:setSpeaker("susie")
            cutscene:text("* DECENT?!", "teeth")
            cutscene:text("* We beat ALL of them,[wait:5] dude!!", "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Well yes...[wait:10] I suppose that is true.", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* Listen man.[wait:10] Can you just let us through?", "nervous")
            cutscene:text("* This is like,[wait:5] kind of important...", "smirk")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Ah yes. The \"investigation\"[wait:10].[wait:10].[wait:10].", nil, scientist)
            cutscene:text("* I think you have an equal inability to grasp the importance of my work.", nil, scientist)
            cutscene:text("* Not to mention the futility of yours...", nil, scientist)
            cutscene:text("* The ping pong table is a second priority.[wait:10] I'll make another one later.", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* This is more important than the table,[wait:5] alright?!", "teeth")
            cutscene:text("* People are getting locked in their rooms...", "angry")
            cutscene:text("* Things are getting busted up,[wait:5] and stolen...", "angry")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Okay.[wait:10] Can you stop bothering me about this now?", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* JUST LET US IN,[wait:5] DAMN IT!!!", "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text("* ...", nil, scientist)
            cutscene:text("* (sigh)", nil, scientist)
            cutscene:text("* Under one condition. [react:1]", nil, scientist, { reactions = { { "OH MY GOD.", "right", "bottom", "teeth", "susie_depths" }, } })
    
            cutscene:text("* I'm kinda hungry.", nil, scientist)
            cutscene:text("* Could you bring me some food from the kitchen?", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* ...[wait:10] Are you kidding?", "stupid")
            cutscene:setSpeaker(scientist)
            cutscene:text("* No.", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* ...", "nervous")
            cutscene:text("* Alright fine.[wait:10] Whatever.", "smirk")
        elseif not Game:getFlag("foodGrabbed") then
            -- This is placeholder but it doesn't matter because funnyFeline won't interact twice here
            cutscene:text("* [speed:0.25]...", nil, scientist)
        elseif not Plot:isBefore("boat_act3_scientist_foodgive") then
            return cutscene:gotoCutscene("boat/act3npcs.scientist3")
        elseif Game:getFlag("foodGrabbed") then
            cutscene:text("* Hey,[wait:5] wow,[wait:5] these are my favorite!", nil, scientist)
            cutscene:text("* I suppose you guys may not be so bad.[wait:10] As you wish...", nil, scientist)
            cutscene:slideTo(scientist, "foodGrabbedMove", 2, nil)
            kris:setFacing("down")
            susie:setFacing("down")
            cutscene:walkTo(kris, "krissafeguard", 0.5)
            cutscene:walkTo(susie, "susiesafeguard", 0.5)
            kris:setFacing("up")
            susie:setFacing("up")
            cutscene:shakeCharacter(scientist)
            Assets.playSound("noise")
            cutscene:wait(2)
            cutscene:shakeCharacter(scientist)
            Assets.playSound("noise")
            Plot:set("boat_act3_scientist_foodgive")
        end
    end,

    bartender3 = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        cutscene:text("* Oh![wait:10] It's you two!", nil, bartender)
        cutscene:text("* Thanks a lot for setting us up together...", nil, bartender)
        cutscene:text("* It feels great to finally take a break...", nil, bartender)
        cutscene:text("* The chef told me I could take the rest of the day off...[wait:10] How kind...", nil, bartender)
        cutscene:text("* Keep up the great work...!", nil, bartender)
    end,

    
    keymaster3 = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local screenguy_happy = cutscene:getCharacter("boatnpcs/screenguy_happy")
        if event.interact_count == 1 then
            cutscene:text("* I am the KEY MASTER!!!![wait:10] Concierge of the CAPTAIN!!!", nil, screenguy_happy)
            cutscene:text("* I will satisfy all of your KEY-RELATED NEEDS!!!", nil, screenguy_happy)
            cutscene:text("* But it seems like all your KEY-RELATED NEEDS have been MET!!!", nil, screenguy_happy)
        elseif event.interact_count >= 2 then
            cutscene:text("* Thanks for stopping by!!", nil, screenguy_happy)
        end
    end,

    spark3 = function(cutscene, event)
        local spark = cutscene:getCharacter("boatnpcs/spark")
        if event.interact_count == 1 then
            cutscene:text("* This lady is like,[wait:5] totally rad,[wait:5] manzz!!", nil, spark)
            cutscene:text("* She'zz like...[wait:10] The moon to my night zkiezz,[wait:5] man!", nil, spark)
            cutscene:text("* She'zz...[wait:10] Electrifying!!", nil, spark)
            
        elseif event.interact_count == 2 then
            cutscene:text("* Thankzzz for everything,[wait:5] manzz!", nil, spark)
        end
    end,

    neutral3 = function(cutscene, event)
        local screenguy_neutral = cutscene:getCharacter("boatnpcs/screenguy_neutral")
        cutscene:text("* It seems that things may be coming to a close soon... ", nil, screenguy_neutral)
        cutscene:text("* And yet,[wait:5] I ain't got much to say. ", nil, screenguy_neutral)
        cutscene:text("* If that isn't the life of playing in the middle... ", nil, screenguy_neutral)
    end,

    bowtie3 = function(cutscene, event)
        local bowtie = cutscene:getCharacter("boatnpcs/legsBowtie")
        cutscene:setSpeaker(bowtie)
        if event.interact_count == 1 then
            cutscene:text("* Thank you for your help last night...", nil, bowtie)
            cutscene:text("* Turns out,[wait:5] this room isn't so bad when you aren't forcefully locked in.", nil, bowtie)
            cutscene:text("* Maybe I'll sit around and relax for a bit longer.", nil, bowtie)
        else
            cutscene:text("* You have my thanks,[wait:5] and my luck...", nil, bowtie)
            cutscene:text("* Toodeloo!", nil, bowtie)
        end
    end,

    awakeguy = function(cutscene, event)
        local awakeguy = cutscene:getCharacter("boatnpcs/awakeguy")
        local susie = cutscene:getCharacter("susie")
        if event.interact_count == 1 then
            cutscene:text("* Huh?[wait:10] Where in the world am I??", nil, awakeguy)
            cutscene:text("* Could've SWORN I fell asleep in my room.[wait:10] Huh.", nil, awakeguy)
            cutscene:text("* Hey.[wait:10] Uh.[wait:10] What room were you in...?", "nervous", susie)
            cutscene:text("* Room 101...[wait:10] That was a nice room...", nil, awakeguy)
            cutscene:text("* But I suppose this one is nice too.", nil, awakeguy)
            cutscene:text("* (Interesting...)", "stupid", susie)
        end
    end,


    flower3 = function(cutscene, event)
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        if event.interact_count == 1 then
            cutscene:text("* Thanks again for helping out my friend here.", nil, flower)
            cutscene:text("* I don't have much else to contribute to the case,[wait:5] but I appreciate you stopping by.", nil, flower)
            
        else
            cutscene:text("* Good luck out there,[wait:5] detectives!", nil, flower)
           
        end
    end,

    detective3 = function(cutscene, event)
        local detective = cutscene:getCharacter("boatnpcs/detective")
        cutscene:text("* I may have given up on the last guy...", nil, detective)
        cutscene:text("* Now THIS![wait:10] This is a PRIME suspect![wait:10] HA!", nil, detective)
        cutscene:text("* Consider this case solved...!", nil, detective)
    end,

    tableguy3 = function(cutscene, event)
        local tableguy = cutscene:getCharacter("boatnpcs/tableguy")
        cutscene:text("* Isn't it odd...", nil, tableguy)
        cutscene:text("* Even when I didn't seek attention,[wait:5] it still found its way over to me.", nil, tableguy)
        cutscene:text("* Thank you for your efforts regardless,[wait:5] detective...", nil, tableguy)

    end,


    legsCrying3 = function(cutscene, event) 
        local susie = cutscene:getCharacter("susie")
        local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
        cutscene:text("* (Sniff,[wait:5] sniff,[wait:5] sob)", nil, legsCrying)
        cutscene:text("* I've begun to come to terms with the (sniff)[wait:5] loss of our table.", nil, legsCrying)
        cutscene:text("* It's gone,[wait:5] and I think that's alright.", nil, legsCrying)
        cutscene:text("* The memories I made with it are worth more than anything a new table could give me.", nil, legsCrying)
        cutscene:text("* And to reflect back on those memories with happiness,[wait:5] is to heal.", nil, legsCrying)
    end,


    casinoNoelle = function(cutscene, event)
        local casinoNoelle = cutscene:getCharacter("boatnpcs/casinoNoelle")
        if event.interact_count == 1 then
            cutscene:text("* Hello there...", nil, casinoNoelle)
            cutscene:text("* I'm just spending me time here in the casino.", nil, casinoNoelle)
            cutscene:text("* I travel from afar in me ship.[wait:10] I love coming on this cruise every now and again.", nil, casinoNoelle)
        else
            cutscene:text("* Ye should be on yer way now,[wait:5] detective.", nil, casinoNoelle) 
        end
    end,

    securitySusie = function(cutscene, event)
        local securitySusie = cutscene:getCharacter("boatnpcs/securitySusie")
        if event.interact_count == 1 then
            cutscene:text("* Hello detective.", nil, securitySusie)
            cutscene:text("* Me was meant to be on me shift...", nil, securitySusie)
            cutscene:text("* BUT...[wait:10] I really,[wait:5] REALLY don't want to do it.", nil, securitySusie)
            cutscene:text("* Yer free to come on through.[wait:10] I'll just be right here...", nil, securitySusie)
        else
            cutscene:text("* Ye should be out solvin' yer case,[wait:5] not talkin' to me!", nil, securitySusie) 
        end
    end,

    

    scientist3 = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local scientist = cutscene:getCharacter("boatnpcs/scientist")
        cutscene:text("* Thanks for the food.[wait:10] Really needed a snack after all my hard work.", nil, scientist)
        cutscene:setSpeaker("susie")
        cutscene:text("* Yeah,[wait:5] uh.[wait:10] For sure dude.", "nervous")
    end,

    pirates = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        local pKris = cutscene:getCharacter("pirates/kris")
        local pSusie = cutscene:getCharacter("pirates/susie")
        local pRalsei = cutscene:getCharacter("pirates/ralsei")
        local pNoelle = cutscene:getCharacter("pirates/noelle")
        cutscene:detachFollowers()
        kris:setPosition(cutscene:getMarker("kris0"))
        susie:setPosition(cutscene:getMarker("susie0"))
        cutscene:wait(0.1)
        cutscene:walkTo(susie, "susie1", 3, "up")
        cutscene:walkTo(kris, "kris1", 3, "up")
        Assets.playSound("ponggame")
        cutscene:wait(6)
        pKris.sprite:pause()
        pRalsei.sprite:pause()
        local sprite = Game.world:getEvent(79)
        cutscene:wait(function()
            return sprite.frame == 1
        end)
        sprite:remove()
        Assets.playSound("hitfloor")
        cutscene:wait(4)
        pKris:resetSprite()
        pRalsei:resetSprite()
        cutscene:wait(1)
        Game.world.music:play("pirates", 1)
        cutscene:text("[miniface:pirates/ralsei]ARRRGHHHH!!!!!", pRalsei)
        cutscene:text("* OH MY GOD OF COURSE IT'S YOU ASSHOLES AGAIN.", "teeth", susie)
        Assets.playSound("jump")
        cutscene:jumpTo(pRalsei, "pRalsei1", 2, 0.2, "jump_ball", "land")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pRalsei)
        cutscene:text("[miniface:pirates/ralsei]YAAAARGHHHH!!![wait:10] SCALLYWAGS,[wait:5] ASSEMBLE!!!", pRalsei)
        cutscene:text("[miniface:pirates/susie]YE GOT IT,[wait:5] CAPTAIN!!", pSusie)
        cutscene:walkTo(pSusie, "pSusie0", 0.3, "down")
        cutscene:wait(0.5)
        Assets.playSound("jump")
        cutscene:jumpTo(pSusie, "pSusie1", 2, 0.6, "jump_ball", "land")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pSusie)
        cutscene:wait(0.5)
        cutscene:text("[miniface:pirates/noelle]Aye aye!", pNoelle)
        cutscene:walkTo(pNoelle, "pNoelle0", 0.3, "down")
        cutscene:wait(0.6)
        Assets.playSound("jump")
        cutscene:jumpTo(pNoelle, "pNoelle1", 2, 0.6, "jump_ball", "land")
        cutscene:wait(0.6)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pNoelle)
        cutscene:wait(0.5)
        cutscene:text("[miniface:pirates/kris]O-ON IT,[wait:5] Cap'n!!!", pKris)
        Assets.playSound("jump")
        cutscene:jumpTo(pKris, "pKris1", 2, 0.2, "jump_ball", "land")
        cutscene:wait(0.5)
        Assets.playSound("noise")
        cutscene:shakeCharacter(pKris)
        cutscene:wait(0.5)
        cutscene:text("[miniface:pirates/ralsei]Now just how did ye open our room!?!", pRalsei)
        cutscene:text("[miniface:pirates/kris]YEAH![wait:10] HOWABOUT IT!?[wait:10]\n[miniface:pirates/noelle]Ye in big trouble now...!", pKris)
        cutscene:text("* ... We opened the door.[wait:10] With your key.", "smile", susie)
        cutscene:look(pRalsei, "left")
        cutscene:wait(0.2)
        cutscene:look(pRalsei, "right")
        cutscene:text("[miniface:pirates/ralsei]Which one of ye was carryin' \nde key??", pRalsei)
        cutscene:look(pKris, "right")
        Assets.playSound("wing")
        cutscene:look(pNoelle, "right")
        Assets.playSound("wing")
        cutscene:text("[miniface:pirates/kris]Wasn't me,[wait:5] Cap'n!![wait:10]\n[miniface:pirates/noelle]Me neither!!", pKris)
        cutscene:text("[miniface:pirates/ralsei]SO...?", pRalsei)
        cutscene:look(pSusie, "left")
        cutscene:text("[miniface:pirates/susie]WELL AYE CAPTAIN BUT YE SEE...", pSusie)
        cutscene:text("[miniface:pirates/susie]I WAS OUT ANNABOUT THE SHIP,", pSusie)
        cutscene:text("[miniface:pirates/susie]AND I THOUGHT IT'D BE A SWELL IDEA TO...", pSusie)
        cutscene:text("[miniface:pirates/susie]YOU KNOW,[wait:5] JUST LEAVE IT \nSOMEWHERE INSTEAD OF KEEPIN' \nIT MESELF!", pSusie)
        cutscene:text("[miniface:pirates/susie]THAT WAY I WOULDN'T LOSE IT.", pSusie)
        cutscene:text("[miniface:pirates/susie]SMART,[wait:5] AMIRITE??", pSusie)
        cutscene:look(pRalsei, "down")
        cutscene:text("[miniface:pirates/ralsei]...", pRalsei)
        cutscene:look(pRalsei, "right")
        cutscene:shakeCharacter(pRalsei)
        Assets.playSound("wing")
        cutscene:look(pKris, "left")
        cutscene:shakeCharacter(pKris)
        cutscene:look(pNoelle, "left")
        cutscene:shakeCharacter(pNoelle)
        cutscene:text("[miniface:pirates/ralsei]YE OIL-LEAKING SCALLYWAG!!!", pRalsei)
        cutscene:look(pRalsei, "down")
        cutscene:text("[miniface:pirates/ralsei]First ye mark an X on our \ndoor cause it\n\"MARKS THE SPOT\"", pRalsei)
        cutscene:look(pRalsei, "right")
        Assets.playSound("wing")
        cutscene:text("[miniface:pirates/ralsei]And now yer leaky pipes lead\nthe Lightners STRAIGHT\nTO OUR ROOM KEY!!", pRalsei)
        cutscene:text("[miniface:pirates/susie]B-BUT BOSS...", pSusie)
        cutscene:text("[miniface:pirates/susie]X DOES MARK THE SPOT!!!", pSusie)
        cutscene:shakeCharacter(pRalsei)
        Assets.playSound("wing")
        cutscene:text("[miniface:pirates/ralsei]That's for TREASURE you\nbilge-suckling sailor!!", pRalsei)
        cutscene:text("[miniface:pirates/susie]ISN'T OUR CREW TREASURE ENOUGH,[wait:5] CAPTAIN??", pSusie)
        susie:setSprite("exasperated_right")
        Assets.playSound("bump")
        cutscene:shakeCharacter(susie)
        cutscene:look(pNoelle, "down")
        cutscene:look(pKris, "down")
        cutscene:look(pRalsei, "down")
        cutscene:look(pSusie, "down")
        Assets.playSound("wing")
        cutscene:text("* HEY.[wait:5] WE'RE STILL HERE!!!", "teeth_b", susie)
        susie:resetSprite()
        cutscene:shakeCharacter(susie)
        cutscene:text("* So you guys we're the ones to steal the table afterall...[wait:10] huh?", "smirk", susie)
        cutscene:look(susie, "left")
        cutscene:text("* What do you say Kris?[wait:10] Should we teach them another lesson?", "smile", susie)
        cutscene:look(susie, "up")
        cutscene:text("[miniface:pirates/noelle]Let us go for it!", pNoelle)
        cutscene:text("[miniface:pirates/noelle]I'm ready to beat yer faces\ninto the ocean floor\nonce and for all!!!", pNoelle)
        cutscene:text("[miniface:pirates/ralsei]Ey,[wait:5] let's not hurry now me hearties...[wait:10]\n[miniface:pirates/noelle]Damn ye...", pRalsei)
        cutscene:text("[miniface:pirates/noelle]I told ye that triangle-headed landblubber was no good...", pNoelle)
        cutscene:text("[miniface:pirates/noelle]If I ever find him again he be walkin' de plank!", pNoelle)
        cutscene:text("[miniface:pirates/noelle]We paid him with precious dubloons and he couldn't\neven cover our tracks!", pNoelle)
        cutscene:text("* Triangle-headed...?", "suspicious", susie)
        susie:setSprite("exasperated_right")
        Assets.playSound("wing")
        cutscene:shakeCharacter(susie)
        cutscene:text("* THAT JERK WAS WITH YOU GUYS THE WHOLE TIME?!?", "teeth", susie)
        susie:resetSprite()
        cutscene:text("* Why are we even talking?!", "teeth_b", susie)
        cutscene:text("* Let's just get to the part where we beat your asses!", "teeth_b", susie)
        cutscene:text("[miniface:pirates/ralsei]Woa woa...[wait:10]\nHold ye sea-horses...", pRalsei)
        cutscene:text("[miniface:pirates/ralsei]A good captain is a smart captain.", pRalsei)
        cutscene:text("[miniface:pirates/ralsei]We couldn't beat ye before,[wait:5]\nwe can't beat ye now.", pRalsei)
        cutscene:look(pKris, "left")
        cutscene:look(pNoelle, "left")
        cutscene:text("[miniface:pirates/kris]Whaddya say we do,[wait:5] Cap'n??[wait:10]\n[miniface:pirates/noelle]Spillit!!\n", pKris)
        cutscene:text("* Yeah,[wait:5] what IS[wait:5] your plan,[wait:5] huh?", "closed_grin", susie)
        cutscene:text("* We're blocking the door.[wait:10] You've got nowhere to go!", "teeth_smile", susie)
        cutscene:text("[miniface:pirates/ralsei]Mateys...", pRalsei)
        cutscene:text("[miniface:pirates/ralsei]RUUUNNNN!!!!!!", pRalsei)
        cutscene:walkTo(pRalsei, "pRalsei2", 0.5, "right")
        cutscene:wait(0.2)
        
        cutscene:walkTo(pSusie, "pSusie2", 0.5, "down")
        cutscene:wait(0.3)
        cutscene:look(pRalsei, "up")
        cutscene:wait(0.5)
        cutscene:look(pSusie, "up")
        cutscene:walkTo(pRalsei, "gangOutside", 0.7, "up")
        Game.world.map:getEvent(53):shake()
        Game.world.map:getEvent(53):slideTo("pongOutside", 0.5)
        cutscene:wait(0.2)
        Game.world.map:getEvent(55):slideTo("pileOffscreen", 0.2)
        Game.world.map:getEvent(53):setLayer(0.4)
        pRalsei:setLayer(0.4)
        Game.world.map:getTileLayer("window").visible = false
        Assets.playSound("windowBreak")
        cutscene:wait(2)
        Assets.playSound("splash")
        cutscene:look(pSusie, "up")
        cutscene:look(pKris, "up")
        cutscene:look(pNoelle, "up")

        cutscene:text("[miniface:pirates/noelle]Of course!\n[miniface:pirates/kris]Great idea,[wait:5] cap'n!\n[miniface:pirates/susie]LET'S MOVE!!", pRalsei)
        
        cutscene:walkTo(pNoelle, "gangOutside", 0.7, "up")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        pNoelle:setLayer(0.4)
        cutscene:walkTo(pKris, "gangOutside", 0.7, "up")
        cutscene:wait(0.4)
        Assets.playSound("wing")
        pKris:setLayer(0.4)
        cutscene:walkTo(pSusie, "gangOutside", 0.7, "up")
        cutscene:wait(0.4)
        Assets.playSound("wing")
        pSusie:setLayer(0.4)
        cutscene:wait(2)
        Assets.playSound("splash")
        cutscene:wait(0.4)
        Assets.playSound("splash")
        cutscene:wait(0.4)
        Assets.playSound("splash")
        Game.world.music:fade(0, 2)
        
        cutscene:wait(2)
        Game.world.music:stop()
        
        cutscene:text("* HUH????", "surprise", susie)
        cutscene:text("* Kris.[wait:10] We are NOT letting them get away!!!", "teeth_b", susie)
        cutscene:look(susie, "left")
        cutscene:text("* If you don't know how to captain a boat...[wait:10] YOU WILL NOW!!", "teeth", susie)
        cutscene:text("* TO THE DECK!!!", "teeth", susie)
        cutscene:attachFollowers()
        Game.world.music:play("creepychase", 1)
        Game:setFlag("room101_confrontation", true)
        Plot:set("boat_act3_room101_confrontation")
    end,

}

return act3npcs