---@type table<string, fun(cutscene:WorldCutscene)>
local stupidbullshit = {
    --[[
love.audio.stop()Kristal.loadGame(3)Game.world:startCutscene("stupidbullshit.omniseveryman")
]]
    omniseveryman = function(cutscene)
        Game:setPartyMembers("kris","susie","ursula")
        Game.world.music:setVolume(0)
        local wait, enc = cutscene:startEncounter("omnis_boss", false, nil, {wait = false})
        Game.stage.timer:afterCond(function() return Game.battle.state == "ACTIONSELECT" end, function()
            Game.battle:startCutscene("omnis.deathapproaches")
        end)
        cutscene:wait(wait)
        Game.fader:fadeIn(nil, {speed = 0.25})
        Game:setPartyMembers("kris")
        cutscene:loadMap("sleeping_world/funny")
        Game.world.player:setFacing("right")
    end;
    yoursavingthewakingworld = function(cutscene)
        -- 3. YOUR SAVING THE WAKING WORLD
        local yttl = Sprite("world/cutscenes/yttl/guywhoappearswhenyouhavetakentoolonginaghosthouse", SCREEN_WIDTH + 80, SCREEN_HEIGHT / 2)
        Game.world:spawnObject(yttl)
        yttl:setScaleOrigin(0.5)
        yttl:setScale(2)
        yttl:slideTo(SCREEN_WIDTH / 2, SCREEN_HEIGHT/2, 0.5, "out-quad")
        cutscene:wait(1.2)
        local snd = love.audio.newSource(Assets.getMusicPath"YOUR SAVING THE WAKING WORLD", "stream")
        snd:play()
        local texts = {
            {"YOUR", 0};
            {" SAFING", 0.7};
            {" THE", 1.2};
            {"\nWAKING", 1.384};
            {" WORLD", 1.73};
        }
        local curr_text = ""
        local textobj = Text()
        textobj:setParallax(0,0)
        textobj:setPosition(200,100)
        Game.world:spawnObject(textobj, 10)
        for i,v in ipairs(texts) do
            cutscene:wait(function() return snd:tell() > v[2] end)
            curr_text = curr_text .. v[1]
            textobj:setText(curr_text)
        end
        textobj:setText("[shake:2]"..curr_text)
        cutscene:wait(1)
        snd:stop() snd:release()
        yttl.graphics.grow = 0.4
        cutscene:wait(cutscene:fadeOut(1))
        
        -- 4. cut to sotww animation but the clock is a cuckoo clock with the john egbert worm thing
        -- 5. cut to kris room. susie breaks their window and says "Woah did time just loooOOOOoOoOOp" to the tune of the unused motif variation in burn it forever
        cutscene:fadeIn(0)
        cutscene:loadMap("hometown/torielhouse/kris_room")
        cutscene:gotoCutscene("nightCutscenes.susie")
    end;
}

return stupidbullshit
