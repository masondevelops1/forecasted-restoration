---@param cutscene WorldCutscene
return function (cutscene)
    cutscene:after(function ()
        Game.world:loadMap(Mod.post_bumper_room or "fileselect")
        Mod.post_bumper_room = nil
    end)
    if Kristal.hasAnySaves() then
        return
    end
    cutscene.world.music:stop()
    local bumper = Chapter6Intro() ---@type Chapter6Intro
    Game.world:addChild(bumper)
    cutscene:wait(function ()
        return bumper.orange and (not bumper.sound:isPlaying())
    end)
    cutscene:wait(cutscene:fadeOut(3))
    cutscene:fadeIn(0.25)
end
