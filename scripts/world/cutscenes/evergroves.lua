---@type table<string, fun(cutscene:WorldCutscene)>
local evergroves = {
    lift1 = function (cutscene)
        ---@type Event.eglift
        local lift = cutscene:getEvent("eglift")
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")

        cutscene:text("* Use the lift?")
        if cutscene:choicer({"Yes", "No"}) == 2 then
            return
        end

        
        cutscene:detachFollowers()
        kris:walkTo("krlift", 1)
        susie:walkTo("suslift", 1)
        cutscene:wait(2)
        local kxo, kyo = kris.x - lift.x, kris.y - lift.y

        kris:setLayer(lift.layer + 0.01)
        susie:setLayer(lift.layer + 0.01)

        local yoffset, duration = 120, 5
        lift.lift:slideTo(lift.lift.x, lift.lift.y + yoffset, duration)
        kris:slideTo(kris.x, kris.y + yoffset, duration)
        susie:slideTo(susie.x, susie.y + yoffset, duration)
        cutscene:wait(cutscene:fadeOut(duration+0.1), {music = true})

        cutscene:gotoCutscene("evergroves.lift2")
    end;

    lift2 = function (cutscene)
        cutscene:loadMap("evergroves/start", "krlift")
        local kris = cutscene:getCharacter("kris")
        local susie = cutscene:getCharacter("susie")
        ---@type Event.eglift_2
        local lift = cutscene:getEvent("eglift_2")

        cutscene:detachFollowers()
        susie:setPosition(cutscene:getMarker("suslift"))
        Game:setFlag("got_money", false)
        cutscene:fadeIn(3)
        Game.world.music:play("mus_evergroves_lift", 0)
        Game.world.music:fade(1, 10)

        lift.lift1:slideTo(lift.lift1.x, lift.lift1.y + 860, 100)
        lift.lift2:slideTo(lift.lift2.x, lift.lift2.y + 860, 100)
        kris:slideTo(kris.x, kris.y + 860, 100)
        susie:slideTo(susie.x, susie.y + 860, 100)
        cutscene:wait(5)
        cutscene:setSpeaker(susie)
        cutscene:text("* ...[wait:60]", "annoyed_down", susie, {auto=true, skip=false})
        cutscene:text("* So these are The Evergroves,[wait:5] huh.[wait:60]", "neutral_side", susie, {auto=true, skip=false})
        cutscene:text("* They're very...[wait:60]", "shy_down", susie, {auto=true, skip=false})
        cutscene:wait(5)
        susie:setFacing("right")
        cutscene:text("* That castle...[wait:5] thing.[wait:60]", "shy_down", susie, {auto=true, skip=false})
        susie:setFacing("left")
        cutscene:text("* You think Noelle went in there?[wait:60]", "neutral", susie, {auto=true, skip=false})
        cutscene:wait(5)
        susie:setFacing("up")
        cutscene:text("* Oh yeah,[wait:5] the fountain,[wait:5] too.[wait:60]", "annoyed_down", susie, {auto=true, skip=false})
        cutscene:text("* It's probably in there.[wait:60]", "neutral", susie, {auto=true, skip=false})
        cutscene:wait(10)
        cutscene:look("susie", "right")
        cutscene:text("* I...[wait:5] I dunno.[wait:60]", "annoyed_down", susie, {auto=true, skip=false})
        cutscene:text("* Everything so far has been so...[wait:30] Overwhelming.[wait:60]", "shy_down", susie, {auto=true, skip=false})
        cutscene:text("* Going on a cruise and fighting pirate clones of us...[wait:60]", "shy_down", susie, {auto=true, skip=false})
        cutscene:text("* And that weird scientist guy...[wait:15] Whatever is up with him.[wait:60]", "annoyed_down", susie, {auto=true, skip=false})
        cutscene:look("susie", "up")
        cutscene:text("* It all feels so...[wait:15] Different.[wait:60]", "neutral_side", susie, {auto=true, skip=false})
        cutscene:text("* Like we're in something important...[wait:60]", "neutral", susie, {auto=true, skip=false})
        cutscene:text("* Way more important than \"saving the world\"...[wait:60]", "neutral", susie, {auto=true, skip=false})
        cutscene:text("* You get me,[wait:5] Kris?[wait:60]", "annoyed_down", susie, {auto=true, skip=false})

        lift.lift1:slideTo(lift.lift1.x, 860, 5)
        lift.lift2:slideTo(lift.lift2.x, 886, 5)
        kris:slideTo(kris.x, 864, 5)
        susie:slideTo(susie.x, 864, 5)
        cutscene:wait(function ()
            return lift.lift1.y >= 860
        end)
        Game.world.music:setVolume(0)
        Assets.playSound("impact")
        cutscene:wait(3)
        cutscene:look("susie", "down")
        cutscene:look("kris", "down")
        cutscene:text("* ...", "neutral")
        cutscene:text("* We're here.", "shy_down")
        cutscene:wait(3)
        cutscene:text("* Man,[wait:5] we're way in too deep to back out now!", "smile")
        cutscene:text("* We'll find Noelle and seal that fountain!", "sincere")
        cutscene:text("* Let's go,[wait:5] Kris!", "sincere_smile")
        Game.money = Game.money + 10000
        Assets.playSound("swing")
        cutscene:look("kris", "down")
        cutscene:look("susie", "up")
        cutscene:wait(0.05)
        cutscene:look("kris", "left")
        cutscene:look("susie", "left")
        cutscene:wait(0.05)
        cutscene:look("kris", "up")
        cutscene:look("susie", "down")
        cutscene:wait(0.05)
        cutscene:look("kris", "right")
        cutscene:look("susie", "right")
        cutscene:wait(0.05)
        cutscene:look("kris", "down")
        cutscene:look("susie", "up")
        cutscene:wait(0.05)
        cutscene:look("kris", "left")
        cutscene:look("susie", "left")
        cutscene:wait(0.05)
        cutscene:look("kris", "up")
        cutscene:look("susie", "down")
        cutscene:wait(0.05)
        cutscene:look("kris", "right")
        cutscene:look("susie", "right")
        cutscene:wait(0.05)
        cutscene:look("kris", "down")
        cutscene:look("susie", "up")
        cutscene:wait(0.05)
        cutscene:look("kris", "left")
        cutscene:look("susie", "left")
        cutscene:wait(0.05)
        cutscene:look("kris", "up")
        cutscene:look("susie", "down")
        cutscene:wait(0.05)
        Assets.playSound("bell")
        susie:setSprite("pose")
        kris:setSprite("pose")
        cutscene:wait(1)
        
        cutscene:look("kris", "down")
        kris:resetSprite()
        susie:resetSprite()

        kris:walkTo(kris.x, kris.y+30, 2)
        susie:walkTo(susie.x, susie.y+30, 2)

        cutscene:wait(2)

        Game.world.music:play("mus_evergroves", 0)
        Game.world.music:fade(1, 1)

        cutscene:interpolateFollowers()
        cutscene:attachFollowers()
    end;

    shop = function (cutscene)
        Assets.playSound("dooropen")
        Game.world:shopTransition("sailorShop")
    end,
    
    sign1 = function(cutscene, event)
        cutscene:text("* There's a sign here.[wait:10] It has a job notice attached: ")	
        cutscene:text("* \"I need someone to watch this dock.\" ")	
        cutscene:text("* \"It's basically guaranteed job security.[wait:10] Ships don't travel here anymore.\" ")	
        cutscene:text("* \"You will be paid in free walls to sit on.\" ")	
        cutscene:text("* - Signed,[wait:5] Egglebert III ")	        
    end,
    sign2 = function(cutscene, event)

        cutscene:text("* There's a sign here.[wait:10] It has a notice attached: ")	
        cutscene:text("* \"The Evergroves Capital has temporarily shut down this dock due to a high resident count.\" ")	
        cutscene:text("* \"All of the buttons will work after this dock has been re-opened.\" ")	
        cutscene:text("* \"We thank all of our residents for your cooperation in these hard times.\" ")	
        cutscene:text("* - Signed,[wait:5] The Evergroves Capital.")
    end,
    sign3 = function(cutscene, event)
        cutscene:text("* There's a sign here.[wait:10] It has a marketing notice attatched: ")	
        cutscene:text("* \"New advancements in The Evergroves now allow for quicker and easier travel!\" ")	
        cutscene:text("* \"All throughout The Evergroves are stations that can quickly transfer you to a destination.\"")	
        cutscene:text("* \"We call them Transferers,[wait:5] and we're happy to finally release them to the public!\"")	
        cutscene:text("* \"NOTICE:[wait:5] All Transferers are temporarily out of service.\"")	
        cutscene:text("* \"They can be activated at the Evergroves Control Panel,[wait:5] which is locked with a royal key.\"")
        cutscene:text("* - Signed,[wait:5] The Evergroves Marketing Team.")
    end,
    dockStation = function(cutscene, event)
        cutscene:text("* There's a sign here.[wait:10] It has some information about the dock:")	
        cutscene:text("* \"WELCOME TO AN EVERGROVES DOCKING STATION!\" ")	
        cutscene:text("* \"ALL DOCKING STATIONS ARE MADE DUE TO THE RESIDENT COUNT GOING UP VERY QUICKLY.\"")	
        cutscene:text("* \"STATIONS ARE ONLY TO BE USED BY BOATS COMING IN FROM DIFFERENT PARTS OF THE DEPTHS.\"")	
        cutscene:text("* - Signed,[wait:5] The Evergroves Capital.")
    end,
}

return evergroves
