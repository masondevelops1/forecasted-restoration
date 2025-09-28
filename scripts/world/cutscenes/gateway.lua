---@type table<string, fun(cutscene:WorldCutscene)>
local gateway = {}

function gateway.chasestart(cutscene)
    local function waitAll(funcs)
        cutscene:wait(function(...)
            for i = 1, #funcs do
                if not funcs[i](...) then return false end
            end
            return true
        end)
    end
    cutscene:detachFollowers()
    local kris = assert(cutscene:getCharacter("kris_lw"))
    local susie = cutscene:getCharacter("susie_lw") or cutscene:spawnNPC("susie_lw", kris.x-20, kris.y)
    local noelle = cutscene:getCharacter("noelle_lw") or cutscene:spawnNPC("noelle_lw", kris.x-40, kris.y)
    ---@type love.Source
    local rumblesrc = Assets.newSound("rumble")
    rumblesrc:setLooping(true)
    local function rumble(duration)
        Game.world.camera:shake(0,4,0)
        rumblesrc:play()
        cutscene:wait(duration)
        rumblesrc:stop()
        Game.world.camera:stopShake()
    end
    rumble(2)
    Game.world.music:stop()
    Assets.playSound("error")
    do
        local layer = Game.world.map:getTileLayer("Error")
        layer.tile_opacity = 1
        layer.drawn = false
    end
    cutscene:wait(1)
    cutscene:walkTo("susie", "suslook", 0.5, "up")
    cutscene:walkTo("kris", "krisinspect", 0.5, "up")
    cutscene:wait(cutscene:walkTo("noelle", "noellesee", 0.5, "up"))
    Game.world.timer:tween(3, Mod.shared_gonerbg, {container = {timescale = 10},saturation = 1})
    Mod.shared_gonerbg.sprite = Assets.getTexture("world/cutscenes/intro/DEPTH_MONO")
    if Game["gateway_collapse_chase_started"] then
        cutscene:text("* We have to go NOW.", "angry_c", susie)
        Game.world.music:play("gateway_collapse_chase")
    else
        cutscene:text("[color:#ff00ff]* Current status: CRITICAL.[wait:5]\n[color:#ff6666]* Collapse imminent.")
        cutscene:text("* Uh, that's a bit concerning.", "suspicious", "susie")
        cutscene:text("* Do you think this was...[wait:5] intentional?", "afraid", noelle)
        local debris = Sprite("world/cutscenes/gateway/debris_3", Game.world.map:getMarker("debris_impact"))
        debris:setScale(2)
        debris:setOrigin(0.5)
        local target_y = debris.y
        debris.y = -debris.height * (1-debris.origin_y)
        Game.world:spawnObject(debris)
        local done = false
        Game.world.map.timer:tween(.4, debris, {y = target_y}, "in-quad", function ()
            Assets.playSound("noelle_scared")
            noelle.y = noelle.y + 4
            Assets.playSound("impact")
            Game.world.camera:shake(0,8,2)
            noelle:setSprite("shocked")
            done = true
        end)
        cutscene:text("* That asshole![wait:5]\n* We gotta get the hell out of here!", "angry_b", susie)
        cutscene:wait(function() return done end)

        waitAll({
            cutscene:walkTo(susie, "offscreen", 1.2),
            cutscene:walkTo(kris, "offscreen", 1),
        })
        cutscene:wait(2)
        
        cutscene:walkTo(kris, "krisreturn", 0.6)
        cutscene:wait(cutscene:walkTo(susie, "susreturn", 0.5))
        
        cutscene:wait(cutscene:walkTo(susie, "susgrab", 0.5))
        susie:setSprite("exasperated_left")
        Assets.playSound("whip_crack_only")
        susie.y = susie.y + 4
        cutscene:text("* NOELLE, WHAT THE HELL IS WRONG WITH YOU!?", "teeth_b", susie)
    end
    
    Assets.playSound("grab")
    local waiter
    if not Game["gateway_collapse_chase_started"] then
        waiter = cutscene:text("* DON'T JUST STAND THERE!!", "teeth_b", susie, {wait = false})
    end
    Game["gateway_collapse_chase_started"]=true
    Plot:set("gateway_collapse")
    susie:setSprite("drag_noelle_readyblush")
    cutscene:wait(.1)
    susie:setAnimation("drag_noelle")
    Mod.shared_gonerbg.afterimage_timer = 0
    local walks = ({
        cutscene:walkTo(kris, "offscreen", 0.75),
        cutscene:walkTo(susie, "offscreen", 0.75),
    })

    cutscene:wait(.5)
    waitAll({
        cutscene:fadeOut(),
        waiter,
    })
    Game.world:loadMap("gateway/chase_spiral")
    cutscene:fadeIn(.5)
    return
end

function gateway.fall_to_depths(cutscene)
    local function waitAll(funcs)
        cutscene:wait(function(...)
            for i = 1, #funcs do
                if not funcs[i](...) then return false end
            end
            return true
        end)
    end
    local kris = cutscene:getCharacter("kris_lw")
    local susie = cutscene:getCharacter("susie_lw")
    local noelle = cutscene:getCharacter("noelle_lw")
    local debris = Sprite("world/cutscenes/gateway/debris_3", Game.world.map:getMarker("debris_impact"))
    debris:setScale(2)
    debris:setOrigin(0.5)
    local debris_target_y = debris.y
    debris.y = -debris.height * (1-debris.origin_y)
    Game.world:spawnObject(debris)
    local debris_fell = false
    Game.world.map.timer:tween(.4, debris, {y = debris_target_y}, "in-quad", function ()
        noelle.y = noelle.y + 4
        Assets.playSound("impact")
        Game.world.camera:shake(0,8,2)
        debris_fell = true
        Game.world.map.timer:tween(.8, debris, {y = debris_target_y+200, alpha = 0})
    end)
    local walk = cutscene:walkToSpeed(kris, kris.x+200, kris.y, 8)

    cutscene:wait(function() return debris_fell end)
    Game.world.width = Game.world.camera.x + (SCREEN_WIDTH/2)
    local bridge = Game.world.map:getTileLayer("Bridge") ---@type TileLayer
    ---@type ShakyObject<TileObject>[][]
    local bridgepieces = {}
    local rumble = Assets.playSound("rumble")
    rumble:setLooping(true)
    for x=(60-1),39,-1 do
        table.insert(bridgepieces, {})
        for y=5,8 do
            local tileset, index = bridge:getTile(x,y)
            local bridgepiece = ShakyObject(
                TileObject(tileset, index, 0,0, 40, 40, 0),
                4, x * 40, (y+1) * 40
            )
            Game.world:spawnObject(bridgepiece, bridge.layer)
            table.insert(bridgepieces[#bridgepieces], bridgepiece)
            bridge:setTile(x,y,0)
        end
    end
    rumble:stop()
    Assets.playSound("vaporized")
    Game.world.music:stop()
    local t_acc = 0
    local function waitacc(dur)
        t_acc = t_acc + dur
        if t_acc + dur > DT then
            cutscene:wait(t_acc)
            t_acc = 0
        end
    end
    for x = 1, #bridgepieces do
        waitacc(0.017)
        for y=1, #bridgepieces[x] do
            local bridgepiece = bridgepieces[x][y]
            bridgepiece:fadeOutAndRemove(Utils.random(0.3,0.5))
            ---@diagnostic disable-next-line: missing-fields
            bridgepiece:setPhysics({
                speed_x = Utils.random(-2, 2)*4,
                speed_y = Utils.random(-2, 2)*4,
                spin = Utils.random(-.2,.2)*4,
            })
            bridgepiece.shaky = 0
        end
        local speed_tbl = {speed_y = 30}
        if bridgepieces[x][1].x <= noelle.x and not noelle.done then
            Game.world.height = 2000
            cutscene:detachFollowers()
            noelle.done = true
            Assets.playSound("noelle_scared")
            noelle:setSprite("shocked")
            Game.world.timer:after(.2, function ()
                Game.world.timer:tween(.8, noelle.physics, speed_tbl, "linear")
            end)
        end
        if bridgepieces[x][1].x <= susie.x and not susie.done then
            susie.done = true
            Assets.playSound("sussurprise")
            susie:setSprite("fall")
            Game.world.timer:after(.2, function ()
                Game.world.timer:tween(.8, susie.physics, speed_tbl, "linear")
            end)
        end
        if bridgepieces[x][1].x <= kris.x and not kris.done then
            kris.done = true
            kris.x = kris.x + 4
            Assets.playSound("bump")
            kris:setSprite("fall")
            Game.world.timer:after(.2, function ()
                Game.world.timer:tween(.8, kris.physics, speed_tbl, "linear")
            end)
        end
    end

    Game.world.timer:tween(3, Mod.shared_gonerbg, {alpha = 0})
    Game.world.timer:tween(5, Mod.shared_gonerbg, {timescale = 0})
    cutscene:wait(1)
    Mod.shared_gonerbg.img_speed_y = -noelle.physics.speed_y
    Mod.shared_gonerbg = nil -- Just in case you somehow manage to get back to the gateway using some insane glitch magic.
    noelle:resetPhysics()
    susie:resetPhysics()
    kris:resetPhysics()
    -- Notably, this puts it _below_ the GonerBackground.
    local transition = Game.world:spawnObject(DepthsTransition(SCREEN_WIDTH/2, SCREEN_HEIGHT+900,900), 0)
    ---@cast transition DepthsTransition
    cutscene:wait(function ()
        return transition.fall_sound:tell() >= 6.2
    end)
    local quote_unquote_water = DepthsWaterOutline(0,0,{SCREEN_WIDTH, SCREEN_HEIGHT*2})
    quote_unquote_water:setColor({0.3,0.3,0.3})
    Game.world:spawnObject(quote_unquote_water)
    quote_unquote_water:setScreenPos(0,SCREEN_HEIGHT)
    Game.world.timer:tween(.2, quote_unquote_water, {y = quote_unquote_water.y - (SCREEN_HEIGHT*.6)}, "out-circ")
    -- Assets.playSound("alert")
    cutscene:wait(0.1)
    Game.world.timer:tween(4, quote_unquote_water, {y = quote_unquote_water.y - (SCREEN_HEIGHT*.4)}, "out-circ")
    kris.physics.speed_y = 1
    noelle.physics.speed_y = 2
    susie.physics.speed_y = 0.5
    cutscene:wait(3)
    cutscene:wait(cutscene:fadeOut(8, {global = true}))
    Game:removePartyMember("susie")
    Game:removePartyMember("noelle")
    cutscene:loadMap("depths/start")
    Game.world.music:stop()
    cutscene:gotoCutscene("depths", "start")
end

return gateway