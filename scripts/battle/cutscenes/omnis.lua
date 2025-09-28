
---@type table<string, fun(cutscene:BattleCutscene)>
local omnis_cutscenes = {
    --[[
Kristal.loadGame(3)
Game:encounter("omnis_boss", false)
Game.stage.timer:afterCond(function() return Game.battle.state == "ACTIONSELECT" end, function()
    Mod.info.loaded_scripts=false Kristal.Mods.getAndLoadMod(Mod.info.id)
    Registry.initCutscenes()
    Game.battle:startCutscene("omnis.deathapproaches")
end)
    ]]
    deathapproaches = function(cutscene)
        -- 1. ursula gets knight-cutscene-bullshit-swooned by omnis
        cutscene:wait(0.5)
        Game.battle.music:pause()
        Game.battle.battle_ui.encounter_text.skipping = true
        Game.fader.alpha = 1
        local spr = Sprite("cutscenes/roaringknight_slash_white_horizontal",32,250)
        spr.layer = 10000
        spr:setScale(2)
        spr:setParent(Game.stage)

        cutscene:wait(1)

        spr:remove()
        Game.fader.alpha = 0
        SystemFloor():smash(1,1)
        local omnis = assert(Game.battle:getEnemyBattler("omnis_boss"))
        local ursula = Game.battle:getPartyBattler("ursula")
        ursula:hurt(math.huge, true, nil, {swoon = true})
        ursula.physics.friction = 0.5
        ursula.physics.speed_x = -8
        -- 2. omnis makes fountain directly on yttl's face
        cutscene:wait(2)
        omnis:slideTo(SCREEN_WIDTH/2, (325/2) + omnis.height)
        cutscene:wait(2)
        local omn_x = omnis.x
        local omn_y = omnis.y
        Game.battle.timer:tween(0.4, omnis, {scale_x = 0.5, y = omnis.y - 20}, "in-quad")
        cutscene:wait(0.1)
        Game.battle.timer:every(2/30, function() Assets.playSound("fountain_target") end, 8)
        cutscene:wait(0.3)
        local pillar = FMPillar(omn_x, omn_y, omnis) --[[@as FMPillar]]
        pillar.layer = omnis.layer - 1
        Game.battle.timer:tween(0.4, omnis, {scale_x = 2, scale_y = 0.2 , y = omnis.y + 20}, "out-elastic")
        cutscene:wait(0.1)
        pillar.timescale = 0.9
        local snd = Assets.stopAndPlaySound("fountain_make", 1, pillar.timescale)
        local tbl = {pitch = snd:getPitch()}
        pillar:setParent(Game.battle)
        cutscene:wait(0.1)
        Game.battle.timer:tween(0.5, omnis, {scale_x = 2, scale_y = 2}, "out-elastic")
        cutscene:wait(5)
        cutscene:wait(function() return pillar:isRemoved() end)
        Game.fader:fadeOut(nil, {speed = 2})
        cutscene:wait(2)
        cutscene:after(function ()
            Game.battle:setState("VICTORY")
            -- see stupidbullshit world cutscene
        end)
    end;
}
return omnis_cutscenes
