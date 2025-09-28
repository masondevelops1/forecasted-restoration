

local function jumpToImproved(character, marker, speed, time, sprite, start_sprite, land_sprite)
    character:jumpTo(marker, speed, time, sprite, start_sprite)
    local jump_startup = 5 / 30     --pulled from "Character:jumpTo"
    local jump_started = false
    Game.stage.timer:after(jump_startup, function()
        jump_started = true
        character.land_sprite = land_sprite
    end)
    -- Actually support cutscene:wait(). For some reason, it didn't before. /Some improvement./
    return function() return jump_started and not character.jumping end
end

---@type table<string, fun(cutscene:WorldCutscene, ...):...>
local boatCutscenes = {

    door105 = function(cutscene, event)
        if cutscene:gotoCutscene("boatCutscenes.suiteSceneCheck") then return end
        cutscene:mapTransition("boat/suite", "spawnInside")
        Assets.playSound("doortransition")
    end,

    suiteExit = function(cutscene, event)
        cutscene:mapTransition("boat/outerDeck")
        Assets.playSound("doortransition")
    end,

    suiteSceneCheck = function (cutscene, ...)
        local suiteScene = nil
        if Plot:isBefore("boat_act1_start") then
            suiteScene = "suiteScene1"
        elseif Plot:get() == PLOT.boat_act1_end then
            suiteScene = "suiteScene2"
        elseif Plot:get() == PLOT.boat_act3_coat then
            suiteScene = "suiteScene3"
        end
        if suiteScene then
            Assets.playSound("dooropen")
            cutscene:wait(cutscene:fadeOut())
            cutscene:loadMap("boat/suite", "spawnOutside")
            return true, cutscene:gotoCutscene("boatCutscenes", suiteScene)
        end
    end,


    suiteEnter = function(cutscene, event)
        -- Which cutscene, if any, should play when entering the suite.
        if cutscene:gotoCutscene("boatCutscenes.suiteSceneCheck") then return end
        cutscene:mapTransition("boat/suite", "spawnOutside")
        Assets.playSound("doortransition")
    end,

    masterKey = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local keyring = Game.inventory:getItemByID("keyring")
        cutscene:text("* (You check the drawer,[wait:5] and...)")
        if keyring then
            cutscene:text("* (You found a drawer!)")
            return
        end
        -- give key
        Game.inventory:tryGiveItem("keyring")
        Assets.playSound("item")
        Mod:playJingle("discovery")
        cutscene:text("* (You got the Key Ring!)")
        cutscene:text("* (You attach your Suite Key.)")
        Game.world.map:setFlag("roomLeaveCheck", true)
        cutscene:setSpeaker("susie")
    end,

    roomLeaveCheck = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        if Game.world.map:getFlag("roomLeaveCheck") then return end
        cutscene:setSpeaker("susie")
        cutscene:text("* Uhh...[wait:10] Kris?[wait:10]\n* Let's not forget that key ring,[wait:5] remember?", "nervous")
        cutscene:detachFollowers()
        cutscene:walkTo("kris", "spawnInside", 0.5)
        cutscene:walkTo("susie", "spawnInside", 0.5)
        cutscene:wait(0.5)
        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end,

    sit = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        if not susie.sitting then
            local old_layer = kris.layer
            local sus_x = susie.x
            local sus_y = susie.y

            cutscene:detachFollowers()
            susie:slideTo(500.00, 192, 0.5, "in-quad")
            susie:setSprite("chilling")
            kris:setLayer(5)

            Assets.playSound("bell_bounce_short")
            susie.sprite:flash()
            cutscene:wait(0.5)

            local angle = Utils.angle(sus_x, sus_y, susie.x, susie.y)

            Assets.playSound("grab")

            local sprite1 = Game.world:spawnObject(AfterImage(susie))
            local sprite2 = Game.world:spawnObject(AfterImage(susie))
            sprite1:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ffb162")))
            sprite2:addFX(OutlineFX()):setColor(Utils.unpackColor(Utils.hexToRgb("#ffb162")))
            sprite1.alpha = 0.5
            sprite2.alpha = 0.5
            sprite1:fadeOutAndRemove(0.5)
            sprite2:fadeOutAndRemove(0.4)
            sprite1.physics.direction = angle
            sprite2.physics.direction = angle
            sprite1.physics.speed = 7
            sprite2.physics.speed = 8

            kris:setLayer(old_layer)

            susie.sitting = true
        else
            cutscene:setSpeaker("susie")
            cutscene:text("* Sorry Kris,[wait:5] couch taken.", "closed_grin")
        end
    end,

    susie_return = function(cutscene)
        local susie = cutscene:getCharacter("susie")
        if susie.sitting then
            cutscene:setSpeaker("susie")
            cutscene:text("* Hey,[wait:5] don't leave without me!!", "teeth_b")

            susie:setFacing("down")
            Assets.playSound("jump")
            jumpToImproved(susie, "susie3", 20, 1, "jump_ball", "chilling", "landed")
            cutscene:wait(0.9)
            Assets.playSound("impact")
            cutscene:wait(0.1)
            susie.sprite:play(0.2, false)
            cutscene:wait(0.5)
            susie:resetSprite()
            cutscene:look(susie, "left")
            cutscene:attachFollowers()
            cutscene:interpolateFollowers()
            cutscene:alignFollowers()

            cutscene:wait(2)

            susie.sitting = false
        end
    end,

    funny = function(cutscene, event)
        function ScreenText(str)
            local text = DialogueText("[speed:0.5]" .. str, 0, 0, 320, 120, { auto_size = true, style = "GONER" })
            text:setOriginExact(text.text_width / 2, text.text_height / 2)
            text:setScreenPos(320, 100)
            text.parallax_x = 0
            text.parallax_y = 0
            Game.world:spawnObject(text, 100)
            cutscene:wait(function()
                return not text:isTyping() and Input.pressed("confirm")
            end)
            text:remove()
        end

        if event.interact_count == 1 then
            ScreenText("Hi Fizz")
            ScreenText("You said this area was inaccessible anyway so...")
            ScreenText("I'm here.")
        else
            ScreenText("Yeah.")
        end
    end,


    lockedDoor = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock,[wait:5] knock,[wait:5] knock...)")
        cutscene:text("* (It's locked...)[wait:10]\n* (Looks like you'll need a key.)")
    end,

    lockedDoor1 = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (Knock,[wait:5] knock,[wait:5] knock...)")
        cutscene:text("* (It's locked...)")
    end,

    outsideStair = function(cutscene, event)
        Assets.playSound("knock")
        cutscene:text("* (The stairwell is blocked off...)")
        local kris = cutscene:getCharacter("kris")
        cutscene:walkToSpeed("kris", 703, kris.y)
        
    end,

    getKey104 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room104", true)
        Mod:playJingle("discovery")
        cutscene:text("* (You got Key104![wait:10] You attach the key to your Key Ring.)")
    end,

    getKey103 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room103", true)
        Mod:playJingle("discovery")
        cutscene:text("* (You got Key103![wait:10] You attach the key to your Key Ring.)")
    end,

    getKey102 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room102", true)
        Mod:playJingle("discovery")
        cutscene:text("* (You got Key102![wait:10] You attach the key to your Key Ring.)")
    end,

    getKey101 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("room101", true)
        Mod:playJingle("discovery")
        cutscene:text("* (You got Key101![wait:10] You attach the key to your Key Ring.)")
    end,

    getBoilerKey = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")
        keyring:setFlag("boilerRoom", true)
        Mod:playJingle("discovery")
        cutscene:text("* (You got the Boiler Key![wait:10] You attach the key to your Key Ring.)")
    end,

    door104 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room104") then
            cutscene:mapTransition("boat/room104", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    door103 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room103") then
            cutscene:mapTransition("boat/room103", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    door102 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room102") then
            cutscene:mapTransition("boat/room102", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    door101 = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("room101") then
            cutscene:mapTransition("boat/room101", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    doorBoilerRoom = function(cutscene, event)
        local keyring = Game.inventory:getItemByID("keyring")

        if keyring and keyring:getFlag("boilerRoom") then
            cutscene:mapTransition("boat/boilerRoom", "spawn")
            Assets.playSound("doortransition")
        else
            cutscene:gotoCutscene("boatCutscenes.lockedDoor")
        end
    end,

    doorKitchen = function(cutscene, event)
        cutscene:mapTransition("boat/diningHall", "spawnKitchen")
        Assets.playSound("doortransition")
    end,

    goldTable = function(cutscene, event)
        cutscene:text("* There's a plaque on the table.")
        cutscene:text("* \"A statue in honor of our beloved ping pong table.\"")
        cutscene:text(
        "* - NOT FOR RECREATIONAL USE\n[wait:10]* - NOT FOR RECREATIONAL USE\n[wait:10]* - NOT FOR RECREATIONAL USE")
    end,

    -- peak. this is peak.
    -- i know it's probably a mess but don't touch it... im proud of it......
    -- (and it's very WIP)
    ---@param cutscene WorldCutscene
    ---@param event Event.slotmachine
    gambling = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")

        cutscene:text("* Have a chance to win Dual Drink Tickets![wait:10] All for the low,[wait:5] low cost of $50!")
        cutscene:setSpeaker("susie")
        cutscene:text("* Hell yeah,[wait:5] Kris![wait:10] Let's play the slot machine!", "surprise_smile")
        cutscene:showShop()
        local choice = cutscene:choicer({ "Yes!!!", "Absolutely not!!!" })
        if choice == 2 then
            cutscene:hideShop()
            cutscene:text("* Kris.[wait:10] You're actually so lame.", "teeth")
            cutscene:text("* Guess we could hold on to our Dark Dollars for now though...", "nervous_side")
        else
            return cutscene:gotoCutscene("boatCutscenes.gamblingMain")
        end
    end;
    gamblingMain = function(cutscene, event)
        if Game.money > 49 then
            Game.money = Game.money - 50
            Assets.playSound("locker")
            local rng = love.math.random(1, 25)
            event.sprite:setAnimation({ "slotSpin", 0.1, true })

            if rng <= 7 then
                cutscene:hideShop()
                Assets.playSound("slots")
                cutscene:wait(2.8)
                cutscene:wait(event:winner())
                cutscene:setSpeaker(nil)
                Assets.playSound("item")
                cutscene:text(
                "* You won a Dual Drink Ticket![wait:10] Go redeem it with the bartender for a drink.[wait:10] (-$50)")
                cutscene:setSpeaker("susie")
                cutscene:hideShop()
                Game:setFlag("gamblingWon", true)
                cutscene:text("* HELL.[wait:10] YES.[wait:10] [react:1]", "surprise_smile",
                    { reactions = { { "You better share...", "right", "bottom", "teeth", "susie_depths" }, } })
                Game:setFlag("drinkTicket", true)
                    
            else
                cutscene:hideShop()
                Assets.playSound("slots")
                cutscene:wait(2.8)
                cutscene:wait(event:loser())
                cutscene:setSpeaker(nil)
                Assets.playSound("error")
                cutscene:text("* You lost,[wait:5] loser.[wait:10] -$50.")
                cutscene:showShop()
                event.sprite:setSprite("slotSpinLose_11")
                cutscene:text("* Try again?")
                local choice2 = cutscene:choicer({ "Yes!!!", "Absolutely not!!!" })
                if choice2 == 1 then
                    cutscene:setSpeaker("susie")
                    return cutscene:gotoCutscene("boatCutscenes.gamblingMain")
                else
                    cutscene:hideShop()
                    cutscene:setSpeaker("susie")
                    cutscene:text("* Alright,[wait:5] that's enough of that.", "nervous")
                end
            end
        else
            cutscene:text("* Kris,[wait:5] we don't have enough money for this...", "nervous")
            cutscene:hideShop()
        end
    end,

    sparkGuy = function(cutscene, event)
        if event.interact_count == 1 then
            local spark = cutscene:getCharacter("boatnpcs/spark")
            cutscene:text("* Heh,[wait:5] heyyy hey hey![wait:10] This place is like,[wait:5] totally chill,[wait:5] huh?", nil, spark)
            cutscene:text("* I'm totally cool.[wait:10] And I'm totally alwayz here.[wait:10] The bartender lovezz me!", nil, spark)
            cutscene:text("* Whoa...[wait:10] I think zzhe'z looking at me right now,[wait:5] dude!", nil, spark)
        elseif event.interact_count == 2 then
            local spark = cutscene:getCharacter("boatnpcs/spark")
            cutscene:text("* Why aren't I zzitting down?[wait:10] I'm wayy too cool for that,[wait:5] manzzz!", nil, spark) 
        elseif Game:getFlag("spokeToBartender", true) then
            local spark = cutscene:getCharacter("boatnpcs/spark")
            cutscene:text("* The bartender zzeems to want to talk to me?", nil, spark) 
            cutscene:text("* W-Well,[wait:5] I'd lovezz to![wait:10] But zzhes always so buzy...[wait:10] Heh,[wait:5] maybe zzome day!", nil, spark) 
        end
    end,


    stairwellScene = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        local detective = cutscene:getCharacter("boatnpcs/detective")
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        local screenguy_angry = cutscene:getCharacter("boatnpcs/screenguy_angry")
        cutscene:fadeOut(0)
        cutscene.world.fader.alpha = 1 -- Make the fadeout instant
        cutscene:wait(1)
        cutscene:detachFollowers()
        cutscene:fadeIn(1.5)
        local x, y = cutscene:getMarker("kris1")
        cutscene:walkTo(kris, x, y, 3, "up")
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 3, "up")
        cutscene:wait(2)
        cutscene:text("* Bystanders,[wait:5] oh bystanders!", nil, flower)
        cutscene:text("* You must've heard the commotion,[wait:5] yes?", nil, flower)
        cutscene:text("* Why else would they be here?[wait:10] You're pissing me off,[wait:5] you know?", nil, screenguy_angry)
        cutscene:text("* You're always just SO ANGRY.[wait:10] When will you learn?", nil, flower)
        cutscene:text("* Alright...[wait:10] both of you.[wait:10] It is pointless to argue.", nil, detective)
        cutscene:text("* You two...[wait:10] Would you be willing to help in,[wait:5] heh...", nil, detective)
        cutscene:text("* ... a little case of mine?", nil, detective)
        cutscene:setSpeaker("susie")
        cutscene:text("* I mean...[wait:10] sure,[wait:5] I guess?", "nervous")
        cutscene:text("* We came down here to check out the screaming anyways...", "sus_nervous")
        cutscene:setSpeaker(detective)
        cutscene:text("* Well...[wait:10] Let's get to work then,[wait:5] shall we? ", nil, detective)
        cutscene:text("* You see... ", nil, detective)
        cutscene:text("* The ship is in absolute disarray.[wait:10] Something very important has been stolen. ", nil, detective)
        cutscene:text("* You there,[wait:5] with the cool armor,[wait:5] you're my new assistant.[wait:10] Take this hat... ", nil, detective)
        Assets.playSound("item")
        Game:getPartyMember("kris"):setFlag("cool_hat", true)
        kris:resetSprite()
        cutscene:setSpeaker(nil)
        cutscene:text("* The [color:yellow]DETECTIVE HAT[color:reset] was added to your HEAD.")
        cutscene:wait(1)
        cutscene:setSpeaker("susie")
        cutscene:text("* HEY!!![wait:10] Why don't I get a cool hat???", "teeth")
        cutscene:setSpeaker(detective)
        cutscene:text("* ...  ", nil, detective)
        cutscene:text("* I didn't account for 2 hats. ", nil, detective)
        cutscene:text("* But you can be the assistant-assistant detective,[wait:5] ok? ", nil, detective)
        cutscene:setSpeaker("susie")
        cutscene:text("* Assistant to KRIS?[wait:10] HA![wait:10] They wish...", "teeth_smile")
        cutscene:text("* (Maybe if you just let me wear that hat...?)", "shy")
        Assets.playSound("wing")
        cutscene:look(kris, "down")
        cutscene:wait(2)
        cutscene:text("* ALRIGHT FINE!![wait:10] Let's just go then,[wait:5] \"detective\"...", "teeth")
        cutscene:fadeOut(1)
        Plot:set("boat_act1_mapswitch")
        cutscene:wait(1)
        cutscene:loadMap("boat/stairwell", "spawnStairs")
        cutscene:wait(1)
        cutscene:fadeIn(1.5)
    end,

    paddle = function(cutscene, event)
        Game.world.map:getEvent(98):remove()
        Assets.playSound("item")
        cutscene:text("* (You got the Paddle!)")
        cutscene:text("* (It was not added to your ITEMs.)")
        cutscene:text("* (It is not a real ITEM.)")
        Plot:set("boat_act1_paddle")
    end,

    neutralScreen1 = function(cutscene, screenguy_neutral)
        cutscene:text("* All this drama,[wait:5] and I ain't feelin' much...", nil, screenguy_neutral)
        cutscene:text("* I'll just be indulging in some tasty drinks for a while.", nil, screenguy_neutral)
    end,

    maid = function(cutscene, event)
        local maid = cutscene:getCharacter("boatnpcs/maid")
        if event.interact_count == 1 then
            cutscene:text("* Oh,[wait:5] you must be the new guests?[wait:10] Please excuse my unpleasantries... ", nil, maid)
            cutscene:text("* I usually like my job a lot,[wait:5] to be frank.", nil, maid)
            cutscene:text("* But this morning has been peculiar...[wait:10] All this oil,[wait:5] did someone get hurt?", nil,
                maid)
        else
            cutscene:text("* I certainly hope not![wait:10]\n* Because that would be more work for me!", nil, maid)
        end
    end,


    bartender = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        cutscene:text("* Hello...[wait:10] What...[wait:10] would you like...?", nil, bartender)
        return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
    end;
    bartenderMain = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        local choice = cutscene:choicer({ "Drink Tickets", "Evidence", "Cool Guy", "Nothing" })
        if choice == 1 and not Game:getFlag("drinkTicket")then
            cutscene:text("* It doesn't seem like...[wait:10] you have any tickets...", nil, bartender)
            cutscene:text("* Bring some back and...[wait:10] I'll get you a drink.", nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        elseif choice == 1 and Game:getFlag("drinkTicket") then
            cutscene:text("* Very good...[wait:10] I'll get you your drink now...", nil, bartender)
            Assets.playSound("item")
            Game.inventory:tryGiveItem("dualDrink")
            cutscene:text("* (The Dual Drink was added to your ITEMS.)")
        end
        if choice == 2 then
            cutscene:text("* Do I know anything about the case...? ", nil, bartender)
            cutscene:text("* Nothing in particular...[wait:10] I've been too busy with my work. ", nil, bartender)
            cutscene:text("* I'd ask the chef if my hands weren't so full...[wait:10] I'm sorry...", nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        end
        if choice == 3 and Plot:between("boat_act2_mapswitch", "boat_act3_mapswitch") then
            cutscene:text("* Hello...[wait:10] I have a favor to ask of you...", nil, bartender)
            cutscene:text("* May you please tell him over there that I... ", nil, bartender)
            cutscene:text("* Would like to talk to him some time...? ", nil, bartender)
            cutscene:text("* I'll get you a drink on the house if you do... ", nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        elseif choice == 3 then
            cutscene:text("* That guy over there...[wait:10] He's so cool...", nil, bartender)
            cutscene:text("* I hope he sticks around...[wait:10] I'd love to chat sometime.", nil, bartender)
            return cutscene:gotoCutscene("boatCutscenes.bartenderMain")
        elseif choice == 3 and Game:getFlag("sparkGuySpokenTo") then
            cutscene:text("* Thank you very much...[wait:10] I'll get you your drink now...!", nil, bartender)
            Assets.playSound("item")
            Game.inventory:tryGiveItem("dualDrink")
            cutscene:text("* (The Dual Drink was added to your ITEMS.)")
        end
        if choice == 4 then
            cutscene:text("* Alright...[wait:10] Enjoy your stay...!", nil, bartender)
            Game:setFlag("spokeToBartender", true)
        end
    end,

    suiteScene1 = function(cutscene, event)
        cutscene.world:getEvent("savepoint").visible = false
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")

        cutscene:detachFollowers()


        --local x, y = cutscene:getMarker("kris0")
        --cutscene:slideTo(kris, x, y, 2, "down")


        --local x, y = cutscene:getMarker("susie0")
        --cutscene:walkTo(susie, x, y, 2, "down")

        local x, y = cutscene:getMarker("spawnOutside")
        cutscene:slideTo(kris, x, y, 0.1)
        local x, y = cutscene:getMarker("spawnOutsideSusie")
        cutscene:slideTo(susie, x, y, 0.1)




        cutscene:fadeOut(0)
        cutscene:setSpeaker("susie")
        cutscene:wait(1)
        cutscene:look(susie, "down")
        cutscene:look(kris, "down")
        cutscene:fadeIn(1.5)
        Assets.playSound("doorclose")
        cutscene:wait(2)
        cutscene:text("* Woah!! ", "surprise")

        local x, y = cutscene:getMarker("susie0")
        cutscene:walkTo(susie, x, y, 2, "right")
        local x, y = cutscene:getMarker("spawnOutsideSusie")
        cutscene:walkTo(kris, x, y, 1, "down")
        cutscene:wait(3)
        cutscene:look(susie, "left")
        cutscene:wait(0.3)
        cutscene:look(susie, "down")
        cutscene:wait(0.3)
        cutscene:look(susie, "up")
        cutscene:wait(0.3)
        cutscene:look(susie, "left")
        cutscene:look(kris, "right")
        cutscene:text("* Nice room,[wait:5] huh Kris?", "closed_grin")
        cutscene:text("* I've never been on a cruise ship before!", "sincere_smile")
        cutscene:look(susie, "up")
        Game.world.music:play("suite")
        cutscene:text("* ...", "nervous")
        cutscene:wait(2)
        cutscene:look(susie, "left")
        cutscene:text("* Y'know,[wait:5] I guess this place isn't so bad...", "neutral")
        cutscene:text("* But all of it feels...[wait:10] off.", "annoyed_down")
        cutscene:text("* I dunno...[wait:10] like,[wait:5] do you even remember how we got here?", "nervous_side")
        cutscene:look(susie, "right")
        cutscene:text("* Shady bunker...[wait:10] Weird papers...", "nervous")
        cutscene:text("* ... exploding power plant...", "nervous")
        cutscene:wait(1)
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 1, "right")
        cutscene:wait(1.2)
        local x, y = cutscene:getMarker("susie2")
        cutscene:walkTo(susie, x, y, 1, "up")
        cutscene:wait(1.2)
        cutscene:text("* But there's not a fountain in sight...", "annoyed")
        cutscene:look(susie, "left")
        cutscene:text("* And we still haven't found Noelle,[wait:5] or Ralsei...", "suspicious")
        cutscene:look(susie, "down")
        cutscene:text("* ...", "shy_down")
        cutscene:wait(2)
        cutscene:look(susie, "up")
        cutscene:text("* I guess they must be at that forest place... ", "smirk")
        cutscene:text("* ... at least that seems to be where we're headed. ", "stupid")
        local x, y = cutscene:getMarker("susie3")
        cutscene:walkTo(susie, x, y, 3, "right")
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(kris, x, y, 4, "right")
        cutscene:wait(1)
        local x, y = cutscene:getMarker("susie3")
        print(x)
        Game.world.camera:panTo("susie3", 4)
        cutscene:text("* But I'm tired of fighting our weird pirate clones anyways...", "neutral")
        local x, y = cutscene:getMarker("couch")
        cutscene:walkTo(susie, x, y, 1, "up")
        cutscene:wait(1)
        Assets.playSound("bump")
        susie:setSprite("chilling")
        cutscene:shakeCharacter(susie)
        cutscene:wait(1.5)
        cutscene:look(kris, "up")
        cutscene:text("* Let's rest for a bit...[wait:10] we could really use it.", "smile")
        kris:setSprite("sit")
        Assets.playSound("noise")
        cutscene:shakeCharacter(kris)
        cutscene:wait(1)
        cutscene:text("* And then we can go eat all the food at the buffet.", "teeth_smile")
        Game.world.music:fade(0, 3)
        cutscene:fadeOut(4)
        cutscene:wait(5)
        cutscene:text("* Kris,[wait:5] that CANNOT be comfortable!!", "teeth")

        -- scream noise
        Plot:set("boat_act1_start")
        cutscene:titleCard(1, "A PECULIAR HAPPENSTANCE")
        kris:setPosition(cutscene:getMarker("kris2"))
        kris:setSprite("fell")
        cutscene.world:getEvent("savepoint").visible = true
        cutscene:fadeIn(1.5)
        cutscene:wait(2)
        Assets.playSound("scream")
        cutscene:wait(1)
        Assets.playSound("bump")
        cutscene:shakeCharacter(kris)
        kris:setSprite("sit")
        cutscene:wait(1)

        cutscene:text("* W-Whuh??[wait:10] What was THAT!?!", "surprise")
        cutscene:shakeCharacter(susie)
        Assets.playSound("bump")
        Assets.playSound("noise")
        local x, y = cutscene:getMarker("susie3")
        susie:resetSprite()
        cutscene:slideTo(susie, x, y, 0.1)
        cutscene:look(susie, "down")
        cutscene:wait(0.5)

        cutscene:wait(1)
        cutscene:look(susie, "left")
        cutscene:wait(0.3)
        cutscene:look(susie, "down")
        cutscene:wait(0.3)
        cutscene:look(susie, "up")
        cutscene:wait(0.3)
        cutscene:look(susie, "right")
        cutscene:wait(2)
        local x, y = cutscene:getMarker("susie4")
        cutscene:walkTo(susie, x, y, 1, "right")
        cutscene:wait(1.5)
        cutscene:text("* Get up,[wait:5] Kris![wait:10] We gotta check this out!!", "shy_b")
        kris:resetSprite()
        Assets.playSound("bump")
        Assets.playSound("noise")
        cutscene:shakeCharacter(kris)
        cutscene:look("kris", "left")
        cutscene:walkTo(susie, "susie5", 2, "right", true)
        cutscene:wait(1)
        cutscene:wait(cutscene:walkTo(kris, "kris3", 1))
        Assets.playSound("noise")
        cutscene:wait(0.5)
        cutscene:look(kris, "down")

        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        Game.world.camera.keep_in_bounds = true
        cutscene:attachCamera()
    end,

    suiteScene2 = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        cutscene.world:getEvent("savepoint").visible = false

        cutscene:detachFollowers()


        --local x, y = cutscene:getMarker("kris0")
        --cutscene:slideTo(kris, x, y, 2, "down")


        --local x, y = cutscene:getMarker("susie0")
        --cutscene:walkTo(susie, x, y, 2, "down")

        local x, y = cutscene:getMarker("fakeSpawn")
        cutscene:slideTo(susie, x, y, 0.1)
        local x, y = cutscene:getMarker("fakeSpawn1")
        cutscene:slideTo(kris, x, y, 0.1)

        local x, y = cutscene:getMarker("susieTalk")
        cutscene:walkTo(susie, x, y, 5, "right")
        local x, y = cutscene:getMarker("krisTalk")
        cutscene:walkTo(kris, x, y, 5, "right")


        cutscene:fadeOut(0)
        cutscene:setSpeaker("susie")
        cutscene:wait(1)
        cutscene:fadeIn(2.5)
        Assets.playSound("doorclose")
        
        cutscene:text("* Phew,[wait:5] that was a lot.[wait:10] Let's chillax for a bit...", "closed_grin")
        cutscene:look(kris, "left")
        cutscene:text("* I can't say I was expecting...[wait:10] This,[wait:5] when getting on this boat...", "smirk")
        cutscene:look(susie, "down")
        cutscene:text("* But...", "nervous")
        cutscene:look(susie, "right")
        cutscene:text("* At least it's more normal than...[wait:10] last time.", "smile")
        cutscene:look(susie, "left")
        cutscene:text("* ...", "shy_down")
        cutscene:look(susie, "right")
        cutscene:text("* So...[wait:10] About this mystery,[wait:5] huh detective?", "teeth_smile")
        cutscene:text("* Let's go over what we've got right now...", "stupid")
        cutscene:text("* Their ping pong table was stolen,[wait:5] and no one knows who did it.", "nervous")
        cutscene:text("* And I guess the culprit was sneaking around at night near the casino.", "nervous_side")
        cutscene:text("* ... and apparently was wearing some large red clothing?", "suspicious")
        cutscene:shakeCharacter(susie)
        Assets.playSound("bump")
        susie:setSprite("away_scratch")
        susie.sprite:play(0.3, loop)
        cutscene:text("* Other than that,[wait:5] I dunno...[wait:10] Kinda a bust,[wait:5] huh?", "nervous")
        cutscene:wait(1)
        susie:resetSprite()
        cutscene:shakeCharacter(susie)
        cutscene:look(susie, "right")
        Assets.playSound("noise")
        cutscene:wait(1)
        cutscene:text("* At least we were able to clear that guy's name.", "nervous")
        cutscene:look(susie, "up")
        cutscene:text("* I've never seen someone so sad about ping pong.", "nervous_side")
        cutscene:look(susie, "right")
        cutscene:text("* I mean,[wait:5] if they took away,[wait:5] I dunno...", "neutral")
        cutscene:text("* That skateboard game I never bothered to learn the name of... ", "neutral_side")
        cutscene:look(susie, "down")
        cutscene:text("* ... I'd be pretty sad too.", "nervous")
        cutscene:wait(2)
        cutscene:text("* Anyways,[wait:5] let's get moving. ", "neutral_side")
        cutscene:text("* We've got a case to follow,[wait:5] detective! ", "teeth_smile")
        cutscene:fadeOut(4)
        -- scream noise
        cutscene.world.map:setFlag("scene2_played", true)
        cutscene:titleCard(2, "THE DOMINO EFFECT")
        Plot:set("boat_act2_mapswitch")
        cutscene.world:getEvent("savepoint").visible = true
        
        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        Game.world.camera.keep_in_bounds = true
        cutscene:attachCamera()
        cutscene:fadeIn(4)

    end,

    suiteScene3 = function(cutscene, event)
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        cutscene.world:getEvent("savepoint").visible = false

        cutscene:detachFollowers()


        --local x, y = cutscene:getMarker("kris0")
        --cutscene:slideTo(kris, x, y, 2, "down")


        --local x, y = cutscene:getMarker("susie0")
        --cutscene:walkTo(susie, x, y, 2, "down")

        local x, y = cutscene:getMarker("fakeSpawn")
        cutscene:slideTo(susie, x, y, 0.1)
        local x, y = cutscene:getMarker("fakeSpawn1")
        cutscene:slideTo(kris, x, y, 0.1)

        local x, y = cutscene:getMarker("susieTalk")
        cutscene:walkTo(susie, x, y, 5, "right")
        local x, y = cutscene:getMarker("krisTalk")
        cutscene:walkTo(kris, x, y, 5, "right")


        cutscene:fadeOut(0)
        cutscene:setSpeaker("susie")
        cutscene:wait(1)
        cutscene:fadeIn(2.5)
        Assets.playSound("doorclose")
        
        cutscene:text("* Alright.[wait:10] Jeez man,[wait:5] what a day...", "nervous")
        cutscene:look(kris, "left")
        cutscene:text("* Let's go over what we got.[wait:10] Surely we're on the tailend of this...", "smirk")
        cutscene:text("* It seems whoever is causing this is...[wait:10] more than one person...?", "neutral_side")
        cutscene:look(susie, "down")
        cutscene:text("* And based on what we saw outside...", "suspicious")
        cutscene:look(susie, "right")
        cutscene:text("* They must've been sneaking around in a trenchcoat...[wait:10] Classic.", "neutral")
        cutscene:look(susie, "left")
        cutscene:text("* I guess they're probably the reason there's oil all over the place,[wait:5] too.", "nervous_side")
        cutscene:text("* ...", "suspicious")
        cutscene:look(susie, "right")
        cutscene:text("* I think we gotta get into Room 101.[wait:10] It's...[wait:10] weird.", "smirk")
        cutscene:text("* Like...[wait:10] A missing key,[wait:5] an odd smell?[wait:10] Oil under the door?", "nervous")
        cutscene:text("* ...", "neutral_side")
        cutscene:text("* But at least we're almost to the Evergroves place...", "nervous_side")
        cutscene:look(susie, "up")
        cutscene:text("* I almost forgot that's why we were even here.", "nervous_side")
        cutscene:wait(2)
        cutscene:look(susie, "right")
        cutscene:text("* Alright,[wait:5] let's roll,[wait:5] detective.", "smile")
        cutscene:text("* We're gonna find that table.", "smile")
        cutscene:fadeOut(4)
        -- scream noise
        cutscene.world.map:setFlag("scene3_played", true)
        Plot:set("boat_act3_start")
        cutscene:titleCard(3, "BOILING OVER")
        cutscene.world:getEvent("savepoint").visible = true
        
        cutscene:attachFollowers()
        cutscene:interpolateFollowers()
        Game.world.camera.keep_in_bounds = true
        cutscene:attachCamera()
        cutscene:fadeIn(4)
    end,

    funnypot = function (cutscene, event)
        local pot = cutscene.world:getEvent(3)
        if event.interact_count > 1 or not pot then
            cutscene:text("* It's a stovetop that isn't in use.")
            return
        end
        pot.physics.gravity = -1
        pot.tile = 69 -- You can't make this shit up
        pot:setFlag("dont_load", true)
    end,
}






local merge = {
    ["boat/act1npcs"] = modRequire("scripts.world.cutscenes.boat.act1npcs"),
    ["boat/act2npcs"] = modRequire("scripts.world.cutscenes.boat.act2npcs"),
    ["boat/act3npcs"] = modRequire("scripts.world.cutscenes.boat.act3npcs"),
    ["boat/opening"] = modRequire("scripts.world.cutscenes.boat.opening"),
}

local cutscene_ids = {}
for k in pairs(boatCutscenes) do
    cutscene_ids[k] = true
end

for groupname, group in pairs(merge) do
    for key, value in pairs(group) do
        if cutscene_ids[key] then
            Kristal.Console:warn("While loading boatCutscenes: Duplicate cutscene " .. key .. ", defined in " .. groupname)
        else
            cutscene_ids[key] = true
        end
    end
end

setmetatable(boatCutscenes, {
    __index = function (self, key)
        for groupname, group in pairs(merge) do
            if group[key] then
                Kristal.Console:warn(("Running \"%s.%s\" instead of \"%s.%s\"."):format(groupname, key, "boatCutscenes", key))
                return group[key]
            end
        end
    end
})


return boatCutscenes
