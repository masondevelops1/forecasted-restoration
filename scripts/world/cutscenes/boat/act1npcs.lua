---@type table<string, fun(cutscene:WorldCutscene,...)>
local act1npcs = {
    flower1 = function(cutscene, event)
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        cutscene:setSpeaker(flower)
        if event.interact_count == 1 then
            cutscene:text("* Oh![wait:10] Detective!", nil, flower)
            cutscene:text("* I mean...[wait:10] Assistant detective.[wait:10] And their assistant-assistant detective.", nil, flower)
            cutscene:text("* This is our game room...[wait:10] Just today,[wait:5] the ping pong table went missing.", nil, flower)
            cutscene:text("* Right now we are holding the wake.", nil, flower)
            cutscene:text("* Everyone is pretty distraught...[wait:10] especially the guy who found it missing.", nil, flower)
            cutscene:text("* If anyone would have any info,[wait:5] it'd be him.[wait:10] I'd go talk to him,[wait:5] he's in the dining room.", nil, flower)
            
        else
            cutscene:text("* Sorry detective,[wait:5] I don't got anything else for you.", nil, flower)
            cutscene:text("* Go talk to the guy in the dining room.", nil, flower)
        end
    end,

    happy1 = function(cutscene, event)
        local screenguy_happy = cutscene:getCharacter("boatnpcs/screenguy_happy")
        cutscene:text("* Yay!!![wait:10] I hated ping pong![wait:10] This is the best day ever!", nil, screenguy_happy)
    end,

    sad1 = function(cutscene, event)
        local screenguy_sad = cutscene:getCharacter("boatnpcs/screenguy_sad")
        cutscene:text("* Ping pong was my favorite pastime...[wait:10] I don't think I'll recover from this... ", nil, screenguy_sad)
    end,

    angry1 = function(cutscene, event)
        local screenguy_angry = cutscene:getCharacter("boatnpcs/screenguy_angry")
        cutscene:text("* Don't you just hate that detective?[wait:10] I'm glad he has someone to keep him in check. ", nil, screenguy_angry)
    end,

    poster1 = function(cutscene, event)
        cutscene:text("* (Several posters are pinned to the wall declaring their love for their favorite pastime.)")
        cutscene:text("* (You wonder where it all went wrong.)")
    end,

    legsCrying1 = function(cutscene, event) 
        if Plot:isBefore("boat_act1_paddle") then
            local susie = cutscene:getCharacter("susie")
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            cutscene:text("* (Sniff, sniff, sob)", nil, legsCrying)
            cutscene:setSpeaker("susie")
            cutscene:look(susie, "down")
            cutscene:text("* Hey man,[wait:5] we uhh...[wait:10] Heard you found the...[wait:10] um...", "nervous")
            cutscene:text("* P-Ping pong tab- ", "nervous_side", { auto = true })
            legsCrying:setSprite("sobbing")
            legsCrying.sprite:play(0.3, loop)
            cutscene:shakeCharacter("susie")
            susie:setSprite("shock_right")
            Assets.playSound("bump")
            cutscene:text("* WAAAAAAAAAAAAAHH!!!", nil, legsCrying)
            cutscene:wait(0.5)
            cutscene:text("* Hey,[wait:5] h-hey![wait:10] It's okay!! ", "sad")
            cutscene:wait(0.5)
            susie:resetSprite()
            cutscene:shakeCharacter("susie")
            cutscene:setSpeaker("susie")
            Assets.playSound("noise")
            cutscene:look(susie, "left")
            cutscene:wait(0.2)
            cutscene:look(susie, "right")
            cutscene:wait(0.2)
            cutscene:look(susie, "down")
            cutscene:wait(0.2)
            cutscene:wait(0.5)
            cutscene:text("* Kris,[wait:5] maybe we could find something to calm this guy down...? ", "stupid")
        elseif not Mod:getKeyringFlag("room104") then
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            legsCrying:resetSprite()
            cutscene:text("* D-did you get this for me...?", nil, legsCrying)
            cutscene:text("* Thanks detective...", nil, legsCrying)
            cutscene:text("* (Sniff,[wait:5] sob)[wait:5] I-I wanted to play ping pong this evening...", nil, legsCrying)
            cutscene:text("* But the table was just gone![wait:10] I couldn't believe it...", nil, legsCrying)
            cutscene:text("* I ran away and haven't stopped (sniff)[wait:5] crying since.", nil, legsCrying)
            cutscene:text("* And as if my night couldn't get any worse...", nil, legsCrying)
            cutscene:text("* Phony detective over there thinks I'm suspect #1!!", nil, legsCrying)
            cutscene:text("* H-here...[wait:10] Take the keys to my room (sniff)[wait:5] s-so you can clear my name.", nil, legsCrying)
            cutscene:gotoCutscene("boatCutscenes.getKey104")
        else
            -- is entirely unreachable for some reason...
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            cutscene:text("* Thank you, [wait:5]it's the least I could do...", nil, legsCrying)
        end
    end,

    detective1 = function(cutscene, event)
        if not Game:getFlag("paddle") then
            local detective = cutscene:getCharacter("boatnpcs/detective")
            cutscene:text("* Why hello again,[wait:5] my wonderful assistants...", nil, detective)
            cutscene:text("* This guy right here is my top suspect.[wait:10] Of course he wont talk!", nil, detective)
            cutscene:text("* But don't worry.[wait:10] I'll make him talk.", nil, detective)
            cutscene:text("* (Sob,[wait:5] sob)")
            cutscene:text("* Tch.[wait:10] Pathetic.", nil, detective)
        else
            local detective = cutscene:getCharacter("boatnpcs/detective")
            local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
            cutscene:text("* Oh well...[wait:10] Go on,[wait:5] check his room....", nil, detective)
            cutscene:text("* ... even though there's no reason.[wait:10] I know he did it.", nil, detective)
            cutscene:text("* (Sniff) I-I...", nil, legsCrying)
            legsCrying:setSprite("sobbing")
            legsCrying.sprite:play(0.3, loop)
            cutscene:text("* WAAAAAAAAAAAAAHH!!!", nil, legsCrying)
            cutscene:setSpeaker("susie")
            cutscene:text("* (... Let's go check his room just to be safe.)", "stupid")
            
        end
    end,

    tableguy1 = function(cutscene, event)
        local tableguy = cutscene:getCharacter("boatnpcs/tableguy")
        cutscene:text("* I fear my natural form may falsely subject me to accusation.", nil, tableguy)
        cutscene:text("* I will hide from them all until it blows over.[wait:10] Please...[wait:10] don't draw attention to me.", nil, tableguy)
    end,

    sleepingguy1 = function(cutscene, event)
        cutscene:text("* (He is sleeping soundly.)")
        cutscene:text("* (Best not to wake him up.)")
    end,
    
    security1 = function(cutscene, event)
        local security = cutscene:getCharacter("boatnpcs/security")
        if not Game:getFlag("kitchenPermission") then
            cutscene:text("* H-huh...?[wait:10] You wanna go into the kitchen?", nil, security)
            cutscene:text("* Sorry boss,[wait:5] this area is strictly off limits for guests.", nil, security)
            cutscene:text("* Only those who have permission from the captain can come in.", nil, security)
        elseif security:getFlag("move_out_of_way") then
            cutscene:text("* Come on through!", nil, security)
        elseif Game:getFlag("kitchenPermission") then
            cutscene:text("* O-oh,[wait:5] you got permission?[wait:10] Come on through!", nil, security)
            cutscene:slideTo(security, "securityMove", 2, nil)
            cutscene:shakeCharacter(security)
            Assets.playSound("noise")
            cutscene:wait(2)
            cutscene:shakeCharacter(security)
            Assets.playSound("noise")
            security:setFlag("move_out_of_way", true)
        end
    end,

    captain1 = function(cutscene, event)
         if event.interact_count == 1 then
            local captain = cutscene:getCharacter("boatnpcs/captain")
            cutscene:text("* Ey,[wait:5] ye need permissin' to go to the kitchen?", nil, captain)
            cutscene:text("* Hm.[wait:10] Yer no chef,[wait:5] but I suppose you're crucial to the case.", nil, captain)
            cutscene:text("* I'll write ye a note.[wait:10] Thanks for helping out.", nil, captain)
            Assets.playSound("item")
            Game:setFlag("kitchenPermission", true)
            cutscene:text("* (The Captain hands you a poorly handwritten permission slip.)")
        elseif event.interact_count >= 2 then
            local captain = cutscene:getCharacter("boatnpcs/captain")
            cutscene:text("* Go on now,[wait:5] kiddos.", nil, captain)
        end
    end,

    room104interact1 = function(cutscene, event)
        cutscene:text("* (There's a trophy on the table.[wait:10] On it,[wait:5] it says[wait:5] \"#1 Ping Pong Fan.\")")
        cutscene:text("* (Behind it are several ping pong-related merchandice products.)")
        cutscene:text("* (Otherwise,[wait:5] it's just a normal room.)")
        cutscene:setSpeaker("susie")
        cutscene:text("* Huh...[wait:10] I guess this guy does just really love ping pong.", "smile")
        cutscene:text("* (We'll get you that table back,[wait:5] buddy.)", "nervous_side")
    end,

    barrel1 = function(cutscene, event)
        cutscene:text("* (It's a pile of barrels.)\n[wait:10]* (Inside the barrels,[wait:5] there are smaller barrels.)")
        cutscene:text("* (What?[wait:10] No there aren't?)")
    end,

    bartender1 = function(cutscene, event)
        local bartender = cutscene:getCharacter("boatnpcs/bartender")
        cutscene:text("* Hey you two...[wait:10] Sorry I can't chat...", nil, bartender)
        cutscene:text("* Got many customers to serve today...", nil, bartender)
    end,

    drinks1 = function(cutscene, event)
        cutscene:text("* (An overwhelming fruity aroma emits from these drinks.)")
    end,

    boxes = function(cutscene, event)
        cutscene:text("* (There are a plethora of boxes.)")
        cutscene:text("* (They come in varying degrees of craftsmanship.)")
        cutscene:setSpeaker("susie")
        cutscene:text("* Man,[wait:5] there's so many here!", "surprise")
        cutscene:text("* Big boxes,[wait:5] small boxes,[wait:5] crappy boxes,[wait:5] not-as-crappy boxes...", "surprise_smile")
        cutscene:text("* This really IS a vacation!", "smile")
    end,

    room104interact2 = function(cutscene, event)
        cutscene:text("* (It's a barrel.)\n[wait:10]* (It's completely overflowing with ping pong balls.)")
    end,

    chef1 = function(cutscene, event)
        local chef = cutscene:getCharacter("boatnpcs/chef")
        
        if event.interact_count == 1 then
            cutscene:text("* W-Welcome detective.[wait:10] Ye got permission from the Captain to come 'ere?", nil, chef)
            cutscene:text("* In that case,[wait:5] I'll tell ye everything I know!", nil, chef)
            cutscene:text("* This evening,[wait:5] right before the incident,[wait:5] I was cleaning up... ", nil, chef)
            cutscene:text("* It was then I 'eard some really weird noises,[wait:5] so I went to check it out. ", nil, chef)
            cutscene:text("* I crept out into the halls,[wait:5] and near the casino,[wait:5] BOOM![wait:10] Huge guy,[wait:5] patrollin' reeeal slow.  ", nil, chef)
            cutscene:text("* Unfortunately,[wait:5] that's about the extent of my knowledge.", nil, chef)
            cutscene:text("* I'd check with people in the casino for more,[wait:5] though.", nil, chef)
            Game:setFlag("gamblingGuy", true)
            Plot:set("boat_act1_chef_talk")
        else
            cutscene:text("* Good luck on your forensics,[wait:5] detective!", nil, chef)
        end
    end,

    bed = function(cutscene, event)
        cutscene:text("* (Looks like a bed.)")
        cutscene:text("* (There's no time to rest.)[wait:5]\n* (You've got a case to solve.)")
        cutscene:text("* (Although just this once,[wait:5] it arguably is your bed.)")
    end,

    bed1 = function(cutscene, event)
        cutscene:text("* (Looks like a bed.)")
        cutscene:text("* (There's no time to rest.)[wait:5]\n* (You've got a case to solve.)")
        cutscene:text("* (Not to mention,[wait:5] still isn't your bed.)")
    end,

    gambler1 = function(cutscene, event)
        local legsDefault = cutscene:getCharacter("boatnpcs/legsDefault")
        local susie = cutscene:getCharacter("susie")
        if not Plot:isBefore("boat_act1_end") then
            cutscene:text("* This message should not appear. If it does, it's a bug.", nil, legsDefault)
            cutscene:text("* Kris! We gotta report this!", "surprise_frown", "susie")
            return
        end
        if not not Plot:isBefore("boat_act1_chef_talk") and Plot:isBefore("boat_act1_gambler_spoken") then
            cutscene:text("* Apologies,[wait:5] detective.", nil, legsDefault)
            cutscene:text("* I'm far too busy trying to win it big.[wait:10] Come back to me later.", nil, legsDefault)
        elseif not Plot:isBefore("boat_act1_chef_talk") and Plot:isBefore("boat_act1_gambler_spoken") then
            cutscene:text("* YESS!!![wait:10] YEEEESSS!!!!", nil, legsDefault)
            cutscene:text("* I've hit it big,[wait:5] for real this time!!", nil, legsDefault)
            cutscene:text("* Ooohoohooooo!!!", nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text("* Dude,[wait:5] what are you talking about?", "suspicious")
            cutscene:setSpeaker(legsDefault)
            cutscene:text("* I JUST found a CRUCIAL piece of evidence for the case...!", nil, legsDefault)
            cutscene:text("* Hehehe![wait:10] Lady-luck smiles at meh at last!!!", nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text("* Yeah.[wait:10] Uh,[wait:5] sure...[wait:10] Well whatever it is,[wait:5] we could really use it.", "stupid")
            cutscene:setSpeaker(legsDefault)
            cutscene:text("* Hmmmm...", nil, legsDefault)
            cutscene:text("* Alrighty then,[wait:5] how about this.", nil, legsDefault)
            cutscene:text("* Play -[wait:5] and win -[wait:5] a round of slots with meh,[wait:5] and I'll give it to ya.", nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text("* I don't see why not...[wait:10] Sounds like it could be fun,[wait:5] actually.", "smile")
            cutscene:text("* But wait,[wait:5] what if we don't have any money?", "surprise")
            cutscene:setSpeaker(legsDefault)
            cutscene:text("* Ehhh...[wait:10] I'll give you some cash from my gambling funds.", nil, legsDefault)
            Game.money = Game.money + 10000
            cutscene:setSpeaker("susie")
            cutscene:text("* Damn,[wait:5] alright![wait:10] If you say so!", "surprise_smile")   
            Game:setFlag("spokenTo", true)
            Plot:set("boat_act1_gambler_spoken")
        end
        if Game:getFlag("gamblingWon") then
            cutscene:text("* Woah![wait:10] Y'all actually did it!", nil, legsDefault)
            cutscene:text("* Well 'eres my scoop.", nil, legsDefault)
            cutscene:text("* Just right now,[wait:5] I found this red piece of cloth.", nil, legsDefault)
            cutscene:text("* Seems to have been torn off from a bigger piece of clothing.", nil, legsDefault)
            cutscene:text("* I suspect it may have something to do with the perpetartor of this crime...", nil, legsDefault)
            cutscene:setSpeaker("susie")
            cutscene:text("* Huh...[wait:10] I dunno what that could be about.", "suspicious")
            cutscene:text("* Well thanks.[wait:10] We'll keep it in mind.", "smile")
            cutscene:text("* (Jeez Kris,[wait:5] all of this is making my head spin.)", "stupid")
            cutscene:text("* (Maybe let's go unpack it all at the suite?)", "nervous_side")
            Plot:set("boat_act1_end")
        end
    end

}

return act1npcs