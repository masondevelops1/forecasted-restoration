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
        cutscene:wait(5)
        cutscene:text("* Heck,[wait:5] we're way in too deep to back out now!", "smile")
        cutscene:text("* We'll find Noelle and seal that fountain!", "sincere")
        cutscene:text("* Let's go,[wait:5] Kris!", "sincere_smile")

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
    end
}

return evergroves
