---@type table<string, fun(cutscene:WorldCutscene,...)>
local act2npcs = {
    maidKris = function(cutscene, event)
        local maidKris = cutscene:getCharacter("boatnpcs/maidKris")
        if event.interact_count == 1 then
            cutscene:text("* It's me shift today...[wait:10] Keepin' workin' hard out 'ere. ", nil, maidKris)
        else
            cutscene:text("* Don't mind me detective.[wait:10] Just be on yer way,[wait:5] these stains are tough.", nil, maidKris)
        end
    end,
    
    flower2 = function(cutscene, event)
        local flower = cutscene:getCharacter("boatnpcs/legsFlower")
        cutscene:setSpeaker(flower)
        if event.interact_count == 1 then
            cutscene:text("* Oh thank goodness,[wait:5] hello detective!", nil, flower)
            cutscene:text("* ... and their assistant-assistant detective.", nil, flower)
            cutscene:text("* I have some developments on the case![wait:10] You see...", nil, flower)
            cutscene:text("* I went to go chat with my friend,[wait:5] however,[wait:5] his door was locked.", nil, flower)
            cutscene:text("* I knocked and knocked,[wait:5] and he eventually got up.", nil, flower)
            cutscene:text("* He told me through the door that he was locked into his room!", nil, flower)
            cutscene:text("* How does this even happen??", nil, flower)
            cutscene:text("* He told me someone ran by and locked it while he was occupied...", nil, flower)
            cutscene:text("* If you find a way in,[wait:5] I'm sure he could give you more details.", nil, flower)
            cutscene:text("* Maybe check with Captain.[wait:10] He sometimes has spare keys to the hall rooms.", nil, flower)
        else
            cutscene:text("* That's all from me for now.[wait:10]\n* Thank you for your hard work,[wait:5] you two.", nil, flower)
            cutscene:text("* Go check if the Captain has a spare key.", nil, flower)
        end
    end,

    sad2 = function(cutscene, event)
        local screenguy_sad = cutscene:getCharacter("boatnpcs/screenguy_sad")
        cutscene:text("* I've got nothing left to do now that our table is gone... ", nil, screenguy_sad)
        cutscene:text("* At least the sweet aroma of these drinks can soothe my broken soul... ", nil, screenguy_sad)
    end,

    neutral2 = function(cutscene, event)
        local screenguy_neutral = cutscene:getCharacter("boatnpcs/screenguy_neutral")
        cutscene:text("* I've distanced myself from the happenings on this boat. ", nil, screenguy_neutral)
        cutscene:text("* That's the easiest way to remain neutral about these things. ", nil, screenguy_neutral)
    end,

    angry2 = function(cutscene, event)
        local screenguy_angry = cutscene:getCharacter("boatnpcs/screenguy_angry")
        cutscene:text("* That detective better be getting to work!!", nil, screenguy_angry)
        cutscene:text("* He really is useless without you two.", nil, screenguy_angry)
    end,

    chefRalsei = function(cutscene, event)
        local chef = cutscene:getCharacter("boatnpcs/chef")
        
        if event.interact_count == 1 then
            cutscene:text("* I'm makin' me food...[wait:10] I'm makin' it right...", nil, chef)
        else
            cutscene:text("* Sorry detective.[wait:10] Can't chat.[wait:10] Ye got yer work to do,[wait:5] anyways.", nil, chef)
        end
    end,

    
    legsCrying2 = function(cutscene, event) 
        local susie = cutscene:getCharacter("susie")
        local legsCrying = cutscene:getCharacter("boatnpcs/legsCrying")
        cutscene:text("* (Sniff,[wait:5] sniff,[wait:5] sob)", nil, legsCrying)
        cutscene:text("* He won't leave me alone...", nil, legsCrying)
        cutscene:text("* Isn't this just awful?", nil, legsCrying)
    end,

    detective2 = function(cutscene, event)
        local detective = cutscene:getCharacter("boatnpcs/detective")
        if event.interact_count == 1 then
            cutscene:text("* Welcome back,[wait:5] my sweet assistants...", nil, detective)
            cutscene:text("* This guy is quite the persistent one.", nil, detective)
            cutscene:text("* But I'll get to him one of these days![wait:10] I promise!", nil, detective)
        else
            cutscene:text("* Sorry assistants.[wait:10] I'm busy right now.", nil, detective)
        end
    end,

    gambler2 = function(cutscene, event)
        local legsDefault = cutscene:getCharacter("boatnpcs/legsDefault")
        local susie = cutscene:getCharacter("susie")
        if event.interact_count == 1 then
            cutscene:text("* They done broke my lucky machine,[wait:5] detective!", nil, legsDefault)
            cutscene:text("* How'll I win big like this??", nil, legsDefault)
        else
            cutscene:text("* You gotta do something,[wait:5] detective!", nil, legsDefault)
        end
    end,

    captain2 = function(cutscene, event)
        local captain = cutscene:getCharacter("boatnpcs/captain")
        if event.interact_count == 1 then
            cutscene:text("* 'Ey detectives!", nil, captain)
            cutscene:text("* What's that?[wait:10] Someone was locked in Room 103 and ye need to it??", nil, captain)
            cutscene:text("* Well...[wait:10] I ain't keep my spares on me no more.", nil, captain)
            cutscene:text("* You can speak with me concierge who holds onto them for me.", nil, captain)
            cutscene:text("* She's typically in the dining room about now.[wait:10] She'd be happy to give ye a key.", nil, captain)
        elseif event.interact_count >= 2 then
            cutscene:text("* Whoever's causing all dis trouble is in for a world o' pain!", nil, captain)
            cutscene:text("* That scallywag...[wait:10] What do you say we make 'em walk the plank?[wait:10] Hooh[wait:5] HA!", nil, captain)
        end
    end,

    keymaster = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local screenguy_happy = cutscene:getCharacter("boatnpcs/screenguy_happy")
        if event.interact_count == 1 then
            cutscene:text("* I am the KEY MASTER!!!![wait:10] Concierge of the CAPTAIN!!!", nil, screenguy_happy)
            cutscene:text("* I will satisfy all of your KEY-RELATED NEEDS!!!", nil, screenguy_happy)
            cutscene:setSpeaker("susie")
            cutscene:text("* Hey...[wait:10] The captain sent us...", "nervous")
            cutscene:text("* He said you might have a spare key to Room 103...?", "nervous")
            cutscene:text("* We could really use it.[wait:10] It seems someone's been locked in their room?", "stupid")
            cutscene:text("* Somehow??", "suspicious")
            cutscene:setSpeaker(screenguy_happy)
            cutscene:text("* Indeed I do!!!", nil, screenguy_happy)
            cutscene:setSpeaker(nil)
            cutscene:text("* Here you go!![wait:10] Please take care of it!!!", nil, screenguy_happy)
            cutscene:gotoCutscene("boatCutscenes.getKey103")
            cutscene:setSpeaker(screenguy_happy)
            cutscene:text("* ...", nil, screenguy_happy)
            cutscene:text("* ... and if you happen to find the key to Room 101,[wait:5] that would be nice...", nil, screenguy_happy)
            cutscene:text("* I kinda...[wait:10] lost it...", nil, screenguy_happy)
            cutscene:setSpeaker("susie")
            cutscene:text("* ... Oh.[wait:10] We'll,[wait:5] uh,[wait:5] keep an eye out for it.[wait:10] Sorry...", "suspicious")
        elseif event.interact_count >= 2 then
            cutscene:text("* Enjoy your key!!!", nil, screenguy_happy)
        end
    end,

    bowtie1 = function(cutscene, event)
        local bowtie = cutscene:getCharacter("boatnpcs/legsBowtie")
        cutscene:setSpeaker(bowtie)
        if event.interact_count == 1 then
            cutscene:text("* Oh thank god![wait:10] Someone finally opened this damn door!", nil, bowtie)
            cutscene:text("* I thought I'd be locked in here for the rest of my life!", nil, bowtie)
            cutscene:setSpeaker("susie")
            cutscene:text("* Uh...[wait:10] Yup.[wait:10] We were able to get a spare key from the concierge.", "suspicious")
            cutscene:text("* How did you even like,[wait:5] get locked in here to begin with...?", "neutral_side")
            cutscene:setSpeaker("captain")
            cutscene:text("* Ah![wait:10] Ah![wait:10] Yes yes,[wait:5] you see...", nil, bowtie)
            cutscene:text("* I was just resting in my room,[wait:5] when all of a sudden...", nil, bowtie)
            cutscene:text("* I heard a bunch of ruckus from outside!", nil, bowtie)
            cutscene:text("* Tons of footsteps pattering about.[wait:10] There were at least a few people out there...", nil, bowtie)
            cutscene:text("* Naturally,[wait:5] I go to take a peek,[wait:5] and BLAMM!!!!", nil, bowtie)
            cutscene:text("* Closed in my face like nothing![wait:10] Can you believe that?", nil, bowtie)
            cutscene:text("* Ugh...[wait:10] The disrespect is unbearable.", nil, bowtie)
            cutscene:text("* Anyways,[wait:5] it sounded like they scuttered around for a while...", nil, bowtie)
            cutscene:text("* Then I heard a door slam,[wait:5] and I couldn't hear much more than muffled chatting.", nil, bowtie)
            cutscene:text("* You might want to talk to other guests on this floor.", nil, bowtie)
            cutscene:text("* The room next door could be a good start,[wait:5] I know that scientist stays there.", nil, bowtie)
            cutscene:text("* He usually hangs around the deck,[wait:5] There's no way he didn't hear what I heard.", nil, bowtie)
            cutscene:setSpeaker("susie")
            cutscene:text("* Damn,[wait:5] that's a lot of info...[wait:10] Thanks!", "surprise")
            Game:setFlag("scientistGuy", true)
        else
            cutscene:text("* The scientist who stays next door might have some more information for you.", nil, bowtie)
            cutscene:text("* He's probably surveying the waters on the deck.", nil, bowtie)
            
        end
    end,

    sparkGuy1 = function(cutscene, event)
        local spark = cutscene:getCharacter("boatnpcs/spark")
        if event.interact_count == 1 then
            cutscene:text("* Zzzee bartender wantz you to azk me if I couldzz hang out with zzer...?", nil, spark)
            cutscene:text("* I'd love to![wait:10] Thankzzz,[wait:5] brah!", nil, spark)
            Game:setFlag("sparkGuySpokenTo", true)
            
        elseif event.interact_count == 2 then
            cutscene:text("* I'll make time for her,[wait:5] azzzaaap!!", nil, spark) 
        end
    end,

    scientist1 = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        local scientist = cutscene:getCharacter("boatnpcs/scientist")
        if not Game:getFlag("scientistGuy") and not Game:getFlag("spokenToScientist") then
            cutscene:text("* ...", nil, scientist)
            cutscene:text("* .[wait:5].[wait:5].", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* .[wait:10].[wait:10].", "suspicious")
            cutscene:setSpeaker(scientist)
            cutscene:text("* .[wait:5].[wait:5].", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* ...", "suspicious")
            cutscene:text("* Hello?", "nervous")
            cutscene:setSpeaker(scientist)
            cutscene:text("* What?[wait:10] What do you want?", nil, scientist)
            cutscene:text("* You're getting in the way of my important work.[wait:10]\n* Do you mind? ", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* Alright dude,[wait:5] we get it.[wait:10] No need to be a jerk about it.", "annoyed")
            cutscene:text("* (Let's get out of here,[wait:5] Kris...)", "neutral")     
        elseif Game:getFlag("scientistGuy") and not Game:getFlag("spokenToScientist") then
            cutscene:text("* Hello?[wait:10] What is it now.", nil, scientist)
            cutscene:text("* Be quick, will you?[wait:10] I'm busy calculating incoming weather patterns.", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* Damn dude,[wait:5] take a load off.", "annoyed")
            cutscene:text("* Anyways...", "neutral")
            cutscene:text("* Did you happen to hear anything going on in the hallways last night?", "suspicious")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Ah.[wait:10] I understand now.[wait:10] You two are the[wait:5] (ehem)[wait:5] detectives.", nil, scientist)
            cutscene:text("* Set in charge to find the missing ping pong table,[wait:5] is it?", nil, scientist)
            cutscene:text("* I'll have you know...[wait:10] I'm in the process of achieving a potential breakthrough.", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* Oh yeah?[wait:10] Tell us about it.", "smile")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Well you see...[wait:10] I'm currently in the process of reverse engineering a new one.", nil, scientist)
            cutscene:text("* The work is mysterious,[wait:5] important,[wait:5] and extremely exhausting.", nil, scientist)
            cutscene:text("* I hit a roadblock in the research as of late.[wait:10] Normally this would be no issue, but...", nil, scientist)
            cutscene:text("* As these silly tables are purely recreational,[wait:5] it cannot be my top priority...", nil, scientist)
            cutscene:text("* But realistically,[wait:5] I am the only one smart enough here to pull such a stunt off.", nil, scientist)
            cutscene:text("* It's very complex,[wait:5] you see...[wait:10] I have to start with the very foundation of it.", nil, scientist)
            cutscene:text("* Analyzing the microfibers of these ping pong balls...", nil, scientist)
            cutscene:text("* Studying their properties to calculate just the right density needed to make it...", nil, scientist)
            cutscene:text("* Created with materials so rare,[wait:5] even I can't get it ri-.", nil, scientist, { auto = true })
            cutscene:setSpeaker("susie")
            cutscene:text("* Alright,[wait:5] I'm gonna be completely honest with you...", "annoyed")
            cutscene:shakeCharacter("susie")
            Assets.playSound("bump")
            susie:setSprite("exasperated_left")
            cutscene:text("* I DON'T CARE!!", "teeth")
            cutscene:text("* DID YOU HEAR ANYTHING OR NOT!?", "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text("* ...", nil, scientist)
            cutscene:text("* I did not hear anything.", nil, scientist)
            cutscene:setSpeaker("susie")
            susie:resetSprite()
            cutscene:text("* ...", "suspicious")
            cutscene:shakeCharacter("susie")
            Assets.playSound("noise")
            susie:setSprite("exasperated_right")
            cutscene:text("* ARE YOU KIDDING ME?!", "teeth")
            susie:resetSprite()
            Assets.playSound("bump")
            cutscene:text("* (God.[wait:10] Such a show-off...)\n[wait:10]* (And for what?)", "nervous")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Well,[wait:5] I wouldn't allow myself to be of no use whatsoever,[wait:5] so...", nil, scientist)
            cutscene:text("* How about I give you the key to my room?", nil, scientist)
            cutscene:text("* You might find something of value towards your... [wait:5](Ahem)[wait:5] \"investigation.\"", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* Hell,[wait:5] sure.[wait:10] Why not.", "smirk")
            cutscene:text("* Wouldn't hurt,[wait:5] I guess...", "suspicious")
            cutscene:setSpeaker(scientist)
            cutscene:text("* ... UNDER[wait:5] a condition.", nil, scientist)
            cutscene:text("* I heard you guys took care of those pesky Scrapscallions on the dock.", nil, scientist)
            cutscene:text("* Even though brute-force uses significantly less skill than how I'd approach it...", nil, scientist)
            cutscene:text("* I will say,[wait:5] I was rather...", nil, scientist)
            cutscene:text("* Hm...[wait:10] how do I put this...", nil, scientist)
            cutscene:text("* \"Impressed\",[wait:5] let's say.", nil, scientist)
            cutscene:text("* Here's the deal.[wait:10] I'm in dire need of tools from the boiler room.", nil, scientist)
            cutscene:text("* The ISSUE is that it's been held captive by Scrapscallions for a good while now.", nil, scientist)
            cutscene:text("* If you can deal with them again,[wait:5] I will give you the key to my room.", nil, scientist)
            cutscene:text("* Here.[wait:10] I'll give you the key to the boiler room.[wait:10] It can be found in the stairwell.", nil, scientist)
            cutscene:setSpeaker("susie")
            cutscene:text("* Ugh...[wait:10] FINE!!", "teeth")
            cutscene:text("* But we're not doing it because you want us to!!", "teeth_b")
            cutscene:text("* We're doing it to get to the bottom of this mystery!!!", "teeth_b")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Whatever you say...[wait:10] Just make sure to get it over with fast.[wait:10] My schedule is booked.", nil, scientist)
            cutscene:setSpeaker(nil)
            cutscene:gotoCutscene("boatCutscenes.getBoilerKey")
            Game:setFlag("spokenToScientist", true)
        end
        if not Plot:isBefore("boat_act2_scrap") then
            cutscene:setSpeaker("susie")
            cutscene:text("* Okay,[wait:5] it's been done.[wait:10] Hand over the key.", "annoyed")
            cutscene:setSpeaker(scientist)
            cutscene:text("* Huh...[wait:10] Splendid.", nil, scientist)
            cutscene:text("* Well,[wait:5] it'd be unprofessional not to stick to my word,[wait:5] so...", nil, scientist)
            cutscene:text("* Here's the key to my room.[wait:10] Don't touch any of my equipment please.", nil, scientist)
            cutscene:setSpeaker(nil)
            cutscene:gotoCutscene("boatCutscenes.getKey102")
        end
    end,

    nook = function(cutscene, event)
        cutscene:text("* (A faint smell of rum emits from the hole in the wall.)")
    end,

    microscope = function(cutscene, event)
        cutscene:text("* (There's a microscope propped up on the table.)")
        cutscene:text("* (It seems to be pointing at a singular ping pong ball,[wait:5] resting in a pitri dish.)")
        cutscene:text("* (Important indeed...)")
    end,

    brokenMachine = function(cutscene, event)
        cutscene:text("* (It appears one of the slot machines has been demolished.)")
        cutscene:text("* (Along with it goes the hopes and dreams of whoever used it.)")
    end,

    lab = function(cutscene, event)
        cutscene:text("* (Various bottles and vials are boiling on the table.)")
        cutscene:text("* (It is unclear what causes them to boil.)")
        cutscene:text("* (Mysterious indeed...)")
        
    end,

    coat = function(cutscene, event)
        local susie = cutscene:getCharacter("susie")
        cutscene:text("* (It's a large red trenchcoat.)")
        cutscene:text("* (It's completely drenched in oil.)")
        cutscene:setSpeaker("susie")
        cutscene:text("* A giant red coat...?[wait:10] Why was the scientist blocking this??", "nervous")
        cutscene:text("* .[wait:10].[wait:10].", "suspicious")
        cutscene:text("* Oh![wait:10] That must be where the piece of red cloth came from!", "surprise")
        cutscene:wait(1)
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:look(susie, "right")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:look(susie, "left")
        cutscene:wait(0.5)
        Assets.playSound("wing")
        cutscene:look(susie, "up")
        cutscene:text("* Well...[wait:10] I dunno.[wait:10] Let's not mess with this...", "suspicious")
        cutscene:text("* We should go back to the room and chat.", "neutral")
        Plot:set("boat_act3_coat")
    end,

    speaker = function(cutscene, event)
        Game.world.music:pause()
        Assets.playSound("intercom_on")
        cutscene:wait(2)
        cutscene:text([=[
[miniface:speaker]H-Hello,[wait:5] It's ye Captain speakin'!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]There's a bit of a storm on 
the way...
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]It's me advision to stay 
inside for the day!
        ]=], some_args)
        cutscene:text([=[
[miniface:speaker]Toodles!
        ]=], some_args)
        Assets.playSound("intercom_off")
        cutscene:wait(2)
        Game.world.music:resume()
        cutscene:setSpeaker("susie")
        cutscene:text("* A storm,[wait:5] huh...?", "suspicious")
        cutscene:text("* I guess now might be a good time to check outside for clues.", "nervous")
        cutscene:text("* ... Now that the scientist has to go inside.", "smile")
        Plot:set("boat_act3_mapswitch")
        
    end,


    room102Visited = function(cutscene, event)
        Game:setFlag("room102Flag", true)
    end



    

}

return act2npcs