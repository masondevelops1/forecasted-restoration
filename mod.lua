
function Mod:afmGetMusic()
    if Mod.ghast_tear_real then return end
    return "sinkingfeeling"
end


function Mod:afmGetChapterName()
    
end

function Mod:getPaletteColor(key)
    if Mod.ghast_tear_real then return end
    if key == "filemenu_deselected" then
        return {0.5, 0.5, 0.5}
    elseif key == "filemenu_selected" then
        return {1,1,1}
    elseif key == "filemenu_header" then
        return {.5,.5,.5}
    elseif key == "filemenu_copy" then
        return {0.5,1,0.5}
    elseif key == "filemenu_settings" then
        return {0.4,1.0,0.2}
    end
end

function Mod:afmCreateBackground(bg)
    if Mod.ghast_tear_real then return end
    local gbg = AdvancedGonerBackground()
    bg.sprite = Assets.getTexture("backgrounds/IMAGE_DEPTH_2")
    bg:addChild(gbg)
end

function Mod:postInit()
    love.window.setTitle("DELTARUNE Chapter 6")
    love.window.setIcon(Assets.getTextureData("icons/deltarune"))
    Kristal.setPresence({
        details = "DELTARUNE Chapter 6",
        state = "- CONNECTION FAILURE -",
        largeImageKey = "https://i.imgur.com/IKdy5Nz.jpeg",
        smallImageKey = "logo",
        largeImageText = "DELTARUNE: Chapter 6 - In Too Deep",
        smallImageText = "Kristal v" .. tostring(Kristal.Version),
        startTimestamp = math.floor(os.time() - Game.playtime),
        instance = 0
    })
    print("Loaded "..self.info.name.."!")
end

function Mod:afmPostInit(new_file)
    if Mod.ghast_tear_real then Mod.ghast_tear_real = nil end
    if new_file then
        Game.world:startCutscene("nightCutscenes.susie")
    end
end

function Mod:unlockQuest(quest, silent)
    if not silent and Game.stage then
        local popup = Game.stage:addChild(QuestCreatedPopup(quest))
        popup.layer = 1500
    end
end

function Mod:completeQuest(quest, silent)
    if not silent and Game.stage then
        local popup = Game.stage:addChild(QuestCompletedPopup(quest))
        popup.layer = 1500
    end
end

function Mod:init()
    Utils.hook(Encounter, "createSoul", function(orig, self, x, y, color)
        if Game.battle.is_parry then
            return ParrySoul(x, y)
        end
        return orig(self, x, y, color)
    end)

    Utils.hook(Encounter, "createSoul", function(orig, self, x, y, color)
        if Game.battle.is_fast then
            return FastSoul(x, y)
        end
        return orig(self, x, y, color)
    end)

    Utils.hook(Battle, "postInit", function(orig, self, ...)
        ---@cast self Battle
        orig(self,...)
        if self.encounter.background then
            self.background = GonerBackground2();
            self:addChild(self.background)
            self.background:setLayer(BATTLE_LAYERS["bottom"] - 1)
        end
    end)
    Utils.hook(Battle, "update", function (orig, self, ...)
        ---@cast self Battle
        orig(self, ...)
        if self.background then
            self.background.alpha = self.transition_timer / 10
        end
    end)
    Utils.hook(Battle, "onStateChange", function (orig, self, old, new)
        ---@cast self Battle
        if new == "VICTORY" and self.background then
            self.background.timer.active = false
        end
        return orig(self, old, new)
    end)
    -- Utils.hook(Battle, "drawBackground", function() end)

---@diagnostic disable-next-line: redefined-local
    local self = Registry
    -- TODO: PR this to kristal, it's cool
    Utils.hook(Registry, "createMap", function(_,id, world, ...)
        if self.maps[id] then
            local map = self.maps[id](world, self.map_data[id], ...)
            map.id = id
            return map
        elseif self.map_data[id] then
            local map_class = self.maps[self.map_data[id].class] or Map
            local map = map_class(world, self.map_data[id], ...)
            map.id = id
            return map
        else
            error("Attempt to create non existent map \"" .. tostring(id) .. "\"")
        end
    end)
end

function Mod:load(data)
    self.silly_mode = Game:getFlag("silly_mode", false)
    self.silly_mode_last = self.silly_mode
    Game:setFlag("silly_mode", self.silly_mode)
end

function Mod:registerDebugOptions(debug)
    debug:registerOption("main", "Silly Mode", function() return debug:appendBool("Toggle Silly Mode", self.silly_mode) end, function()
        self.silly_mode = not self.silly_mode
        Game:setFlag("silly_mode", self.silly_mode)
    end)
end

function Mod:postUpdate()
    if Kristal.DebugSystem:isMenuOpen() then return end

    if self.silly_mode ~= self.silly_mode_last then
        if self.silly_mode_message then
            self.silly_mode_message:remove()
        end

        if self.silly_mode then
            Assets.playSound("won")

            self.silly_mode_message = SillyModeMessage()
            Game.stage:addChild(self.silly_mode_message)
        end

        Game:setFlag("silly_mode", self.silly_mode)

        self.silly_mode_last = self.silly_mode
    end
end

function Mod:loadObject(world,name,data)
    if name == "gonerbg" then
        if not self.shared_gonerbg then
            ---@type AdvancedGonerBackground
            self.shared_gonerbg = AdvancedGonerBackground()
            if data and data.properties and data.properties.collapse then
                self.shared_gonerbg.saturation = 1
                self.shared_gonerbg.container.timescale = 10
                self.shared_gonerbg.afterimage_timer = 0
                self.shared_gonerbg.sprite = Assets.getTexture("world/cutscenes/intro/DEPTH_MONO")
            end
        end
        self.shared_gonerbg:applyProperties(data and data.properties or {})
        self.shared_gonerbg:remove()
        return self.shared_gonerbg
    end
end

function Mod:getUISkin()
    -- cool lore
    if Game:getFlag("special_textbox") then
        return "knight"
    end
end

--- Convenience function for development
function Mod:runWave(wave)
    assert(isClass(wave) or Registry.getWave(wave), "Invalid wave: "..Utils.dump(wave))
    if not Game.battle then
        Game:encounter("wavetester")
        Game.battle.encounter.waves = {wave}
    else
    end
    Game.battle:setState("DEFENDINGBEGIN", { wave })
    Kristal.Console:close()
end

function Mod:playJingle(sound, ...)
    local music = Game:getActiveMusic()
    music:pause()
    local src = Assets.playSound(sound, ...)
    Game.stage.timer:afterCond(function ()
        return not src:isPlaying()
    end, function ()
        music:resume()
    end)
end

function Mod:getKeyringFlag(name)
    local keyring = Game.inventory:getItemByID("keyring")
    if not keyring then
        return nil, false
    end
    return keyring:getFlag(name)
end

---@return boolean success Whether the flag was successfully set.
function Mod:setKeyringFlag(name, value)
    local keyring = Game.inventory:getItemByID("keyring")
    if not keyring then
        return false
    end
    keyring:setFlag(name, value)
    return true
end

function Mod:onRegistered()
    -- TODO: Proper iterScripts? AHAHAHAHAHAHHAHAHAHAHAHAHAHAHAHAHAHAHAH
    Mod.pong_cutscenes = {
        pirates = modRequire("scripts.pong.cutscenes.pirates")
    }
end

function Mod.getPongCutscene(group, id)
    local cutscene = Mod.pong_cutscenes[group]
    if type(cutscene) == "table" then
        return cutscene[id], true
    elseif type(cutscene) == "function" then
        return cutscene, false
    end
end

function Mod:onMapMusic(map, orig_music)
    -- Workaround for mapTransition passing the wrong map
    if orig_music == "evergrove-outskirts" then
        return "evergrove-outskirts"
    end
    if Utils.startsWith(map.id, "boat/") then
        if orig_music == "waves" then

            if false then
            elseif not Plot:isBefore("boat_end") then
                return "evergrove-outskirts"
            elseif not Plot:isBefore("boat_act3_mapswitch") then
                return "rain_outdoors"
            end
            -- TODO: Incorporate room101_confrontation into plot
        elseif Plot:between("boat_act3_room101_confrontation", "boat_end", true, false) then
            return "creepychase"
        end
    end
    -- Cool nonstandard thing that should really be in Kristal tbh
    if map.onMusic then
        local mus = map:onMusic(orig_music)
        if mus then return mus end
    end
end

---@deprecated
---@param plot PLOT.key|PLOT
function Mod:plotAfter(plot)
    return Plot:isAfter(plot)
end

---@deprecated
---@return PLOT
---@return PLOT.key
function Mod:getPlot()
    local plot = Game:getFlag("plot", 0)
    return plot, Utils.getKey(PLOT, plot)
end

---@deprecated
---@param plot PLOT.key|PLOT
function Mod:setPlot(plot)
    return Plot:set(plot)
end

function Mod:quickerReload()
    Kristal.callEvent(KRISTAL_EVENT.unload)
    Kristal.setState("Empty")
    Mod.info.loaded_scripts = false
    Kristal.Mods.getAndLoadMod(Mod.info.id)
    Kristal.callEvent(KRISTAL_EVENT.preInit)
    Registry.initialize()
    Kristal.setState("Game")
end

function Mod:getUISkin()
    if self.ui_skin_override then return self.ui_skin_override end
    if not (Game.world and Game.world.map and Game.world.map.id) then return end
    if Utils.startsWith(Game.world.map.id, "gateway") then
        return "twilight"
    end
end

function Mod:setUISkin(skin)
    self.ui_skin_override = skin
    UISkinLib:swapUISkin(Kristal.callEvent(KRISTAL_EVENT.getUISkin) or (Game:isLight() and "light" or "dark"))
end

function Mod:onFootstep(char, num)
    if char.world.map.data.properties.step_sound then
        local player_only, step_sound = Utils.startsWith(char.world.map.data.properties.step_sound, "player:")
        if player_only and not char.is_player then return end
        local sound_path = "steps/"..step_sound .. Utils.clampWrap(num, 2)
        print(sound_path)
        Assets.playSound(sound_path)
    end
end
