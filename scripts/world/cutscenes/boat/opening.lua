---@type table<string, fun(cutscene:WorldCutscene, ...)>
local opening = {
    


    sparkOpening = function(cutscene, event)
        local spark = cutscene:getCharacter("boatnpcs/spark")
        cutscene:setSpeaker(spark)
        if event.interact_count == 1 then
            cutscene:text("* Wazzuuup maaan!", nil, spark)
            cutscene:text("* I'm like,[wait:5] totally getting tired of waiting,[wait:5] man...", nil, spark)
            cutscene:text("* But I'm also way,[wait:5] totally,[wait:5] abzzolutely too cool to zzzit down.", nil, spark)
            cutscene:text("* Hopefully Captain will zzzolve all zzat commotion zzoon...", nil, spark)
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count >= 3 then
            event.interact_count = 2
            cutscene:text("* Youzz dealt with thozzeee Scrapscallionzz?[wait:10] Not bad at all,[wait:5] kid.", nil, spark)
            cutscene:text("* Zzeee yuh on the vacation of a lifetime,[wait:5] man!", nil, spark)
        elseif event.interact_count >= 2 then
            cutscene:text("* Peazzcceee,[wait:10] mannnnn!", nil, spark)
        end
    end,

    bartenderOpening = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        if event.interact_count == 1 then
            cutscene:text("* I've been out of my job for a while...[wait:10] I don't mind the waiting.", nil, bartender)
            cutscene:text("* A couple more minutes won't hurt...", nil, bartender)
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count >= 3 then
            cutscene:text("* Thank you for dealing with those...", nil, bartender)
            cutscene:text("* I don't think our Captain has the fighting strength he used to...", nil, bartender)
        elseif event.interact_count >= 2 then
            cutscene:text("* My favorite customer is standing right over there...", nil, bartender)
            cutscene:text("* Do you think he's getting on the boat as well...?", nil, bartender)
        end
    end,


    gamblerOpening = function(cutscene, event)
        local legsDefault = cutscene:getCharacter("boatnpcs/legsDefault")
        if event.interact_count == 1 then
            cutscene:text("* Hooohoohooo![wait:10] I just can't wait...!", nil, legsDefault)
            cutscene:text("* I need my fix...[wait:10] I haven't played the slots in so long!", nil, legsDefault)
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count >= 3 then
            cutscene:text("* Great work on takin' care of those Scrappies...", nil, legsDefault)
            cutscene:text("* See yah on the ship!", nil, legsDefault)
        elseif event.interact_count >= 2 then
            cutscene:text("* If ya take care of those Scrapscallions,[wait:5] I'll be sure to share mah winnings with ya!", nil, legsDefault)
        end
    end,

    captainOpening = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local captain = cutscene:getCharacter("boatnpcs/captain")
        cutscene:setSpeaker(captain)
        if event.interact_count == 1 then
            cutscene:text("* H-Hey kiddos![wait:10] Could ye help me out here??[wait:10] Please???")
            cutscene:setSpeaker("susie")
            cutscene:look(susie, "up")
            cutscene:text("* Dude,[wait:5] we really don't have time for this.[wait:10] Can you just let us on?", "annoyed")
            cutscene:setSpeaker(captain)
            cutscene:text("* ...")
            cutscene:text("* Do ye have yer tickets?")
            cutscene:look(susie, "left")
            cutscene:wait(1)
            cutscene:setSpeaker("susie")
            cutscene:look(susie, "up")
            cutscene:text("* NO!!!", "teeth")
            cutscene:text("* Look, do you want help or not?[wait:10] We already fixed your dumb terminal.", "teeth_b")
            cutscene:setSpeaker(captain)
            cutscene:text("* ...")
            cutscene:text("* O-Okay mateys,[wait:5] l-let's calm down here!")
            cutscene:text("* I'll cut ye' kiddos a deal.")
            cutscene:text("* Help me out,[wait:5] and I'll let you on,[wait:5] free of charge!")
            cutscene:wait(2)
            cutscene:text("* A-And I'll give you a key to our premium suite,[wait:5] no extra cost!")
            cutscene:setSpeaker("susie")
            cutscene:text("* ALRIGHT,[wait:5] ALRIGHT.[wait:10] You have a deal,[wait:5] what do you want.", "teeth")
            cutscene:setSpeaker(captain)
            cutscene:text("* T-Thank you,[wait:5] just...[wait:10] on that bridge riiiight there.")
            cutscene:text("* Openin' up these terminals finally let us off this darn boat...")
            cutscene:text("* But these Scrapscallions keep gettin' in me ship!")
            cutscene:text("* And now none' these new guests are able to get on.")
            cutscene:text("* Get rid of 'em, and you're on a premium trip yer never to forget!")
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count ~= 3 then
            cutscene:text("* PHEW![wait:10] Thank yer for all the help![wait:10] Here's ye key,[wait:5] as promised!")
            Assets.playSound("item")
            cutscene:setSpeaker(nil)
            cutscene:text("* (You got the SuiteKey!)")
            cutscene:setSpeaker(captain)
            cutscene:text("* Ye can find a key ring to keep it safe in yer drawer in the room.")
            event.interact_count = 2
        elseif Game.world.map:getFlag("enemyDefeated") and event.interact_count == 3 then
            cutscene:setSpeaker(captain)
            event.interact_count = 2
            cutscene:text("* Thank ye for all yer help,[wait:5] kiddos.[wait:10] Enjoy ye stay!")
        elseif event.interact_count == 2 then
            cutscene:text("* Ye shiny key is waiting right 'ere,[wait:5] just as soon as you deal with em... ")
            event.interact_count = 1
        end
    end,
    scrapscallionEncounter = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local kris = cutscene:getCharacter("kris")
        local scrapscallion = cutscene:getCharacter("scrapscallion")
        cutscene:setSpeaker("susie")
        cutscene:detachFollowers()
        local x, y = cutscene:getMarker("susie1")
        cutscene:walkTo(susie, x, y, 1, "up")
        local x, y = cutscene:getMarker("kris1")
        cutscene:walkTo(kris, x, y, 1, "up")
        cutscene:wait(1)
        cutscene:text("* Huh...[wait:10] This one isn't moving at all...", "nervous")
        cutscene:text("* What if we just,[wait:5] moved it out of the way ourselves?", "nervous_side")
        cutscene:wait(0.3)
        cutscene:look(susie, "down")
        cutscene:wait(0.3)
        cutscene:look(susie, "right")
        cutscene:wait(0.3)
        cutscene:look(susie, "up")
        cutscene:wait(0.3)
        cutscene:look(susie, "left")
        cutscene:wait(1)
        cutscene:text("* Hey Kris,[wait:5] want to see me shove this thing?", "smile")

        susie:setSprite("shock_up")
        local x, y = cutscene:getMarker("susie2")
        cutscene:shakeCharacter("susie")
        cutscene:slideTo(susie, x, y, 0.1)
        Assets.playSound("locker")
        cutscene:shakeCharacter("scrapscallion")
        cutscene:wait(0.2)
        local x, y = cutscene:getMarker("susie1")
        cutscene:slideTo(susie, x, y, 0.1)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        susie:resetSprite()
        cutscene:wait(1)
        Assets.playSound("wing")
        susie:setSprite("away_turn")
        cutscene:shakeCharacter("susie")
        cutscene:text("* ...", "nervous")
        cutscene:text("* This thing won't budge,[wait:5] huh?", "nervous_side")
        cutscene:look(susie, "up")
        susie:resetSprite()
        cutscene:wait(2)
        cutscene:wait(1)
        cutscene:text("* I dunno...[wait:10] What if I just-", "nervous", { auto = true })
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.2)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.2)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("bump")
        cutscene:wait(0.1)
        cutscene:shakeCharacter("scrapscallion")
        Assets.playSound("noise")
        scrapscallion:setSprite("idle")
        scrapscallion.sprite:play(0.3, loop)
        cutscene:text("* ...!!!", "shock_nervous")
        cutscene:text("* ALRIGHT,[wait:5] JUST COME AT US ALREADY!!!", "teeth_b")

        cutscene:attachFollowers()
        Game.world.map:setFlag("enemyDefeated", true)
        cutscene:startEncounter("scrapscallion", nil, event)
        Game.world.map:getEvent(2):remove()
    end,
}

return opening