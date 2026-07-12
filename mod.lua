function Mod:afmGetMusic()
    if Mod.ghast_tear_real then return end
    if Mod:intermissionReached() then return "AUDIO_DRONE" end
    --if Mod:ch7Reached() then return "spireselect" end
    return "sinkingfeeling"
end


function Mod:afmGetChapterName()
    --if Mod:ch7Reached() then return "Chapter 7" end
    return "Chapter 6"
end

function Mod:afmGetStyle()
    --if Mod:ch7Reached() then
        --return "ch7"
    --end
    return "DEVICE"
end

function Mod:getPaletteColor(key)
    if Mod.ghast_tear_real then return end
    if Mod:intermissionReached() then return end
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
    if Mod:intermissionReached() then return end
    --if Mod:ch7Reached() then return end
    local gbg = AdvancedGonerBackground()
    bg.sprite = Assets.getTexture("backgrounds/IMAGE_DEPTH_2")
    bg:addChild(gbg)
end

function Mod:postInit()
    love.window.setTitle("DELTARUNE")
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
    if Mod:intermissionReached() then
        Mod:stashPreIntermissionSaves()
        return
    end
    print("Loaded "..self.info.name.."!")
end

function Mod:afmPostInit(new_file)
    if Mod.ghast_tear_real then Mod.ghast_tear_real = nil end
    if new_file then
        local equipments = Mod.info.equipment
        if equipments then
            for id, equipped in pairs(equipments) do
                local member = Game.party_data[id]
                if member then
                    if equipped.weapon then
                        member:setWeapon(equipped.weapon ~= "" and equipped.weapon or nil)
                    end
                    local armors = equipped.armor or {}
                    for i = 1, #armors do
                        if armors[i] then
                            member:setArmor(i, armors[i] ~= "" and armors[i] or nil)
                        end
                    end
                else
                    Kristal.Console:error("Attempted to set equipment for non-existent member " .. id)
                end
            end
        end

        Game.lw_money = 34
    
        local inventory = Mod.info.inventory
        if inventory then
            Game.inventory:clear()
            Game.light_inventory:clear()
            Game.dark_inventory:clear()
            if inventory.items then
                for i, item in ipairs(inventory.items) do
                    Game.inventory:setItem("items", i, item)
                end
            end
            if inventory.key_items then
                for i, item in ipairs(inventory.key_items) do
                    Game.inventory:setItem("key_items", i, item)
                end
            end
            if inventory.storage then
                for i, item in ipairs(inventory.storage) do
                    Game.inventory:setItem("storage", i, item)
                end
            end
        end
        
        if Mod:intermissionReached() then
            Game.world:loadMap("basket")
            --Plot:set("nf_school_init")
            Game.world.menu = nil
        else
            Game.world:startCutscene("nightCutscenes.susie")
        end
    end
end

function Mod:unlockQuest(quest, silent)
    if not silent and Game.stage then
        --local popup = Game.stage:addChild(QuestCreatedPopup(quest))
        --popup.layer = 1500
    end
end

function Mod:completeQuest(quest, silent)
    if not silent and Game.stage then
        --local popup = Game.stage:addChild(QuestCompletedPopup(quest))
        --popup.layer = 1500
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
        if Game:isLight() then
            self.battle_ui.action_boxes[2].buttons[2].disabled = true
            self.battle_ui.action_boxes[3].buttons[2].disabled = true
        end
    end)
    Utils.hook(BattleBackground, "init", function(orig, self, ...)
        ---@cast self Battle
        orig(self,...)
        self.background = GonerBackground2();
        self:addChild(self.background)
        self.background:setLayer(BATTLE_LAYERS["bottom"] - 50)
    end)
    Utils.hook(BattleBackground, "drawBackground", function(orig, self, ...)
        ---@cast self Battle
        orig(self,...)
    end)
    Utils.hook(BattleBackground, "update", function (orig, self, ...)
        ---@cast self Battle
        orig(self, ...)
        if self.background then
            self.background.alpha = self.alpha
        end
    end)
    Utils.hook(BattleBackground, "onStateChange", function (orig, self, old, new)
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

function Mod:stashPreIntermissionSaves()
    local base = "saves/" .. Mod.info.id
    local stash = base .. "/pre-intermission"
    local marker = base .. "/stash_completed"

    if love.filesystem.getInfo(marker) then
        return
    end

    if not love.filesystem.getInfo(stash) then
        love.filesystem.createDirectory(stash)
    end

    local targets = { "file_1.json", "file_2.json", "file_3.json" }
    local stashed_any = false

    for _, filename in ipairs(targets) do
        local src = base .. "/" .. filename
        local dst = stash .. "/" .. filename
        local info = love.filesystem.getInfo(src)

        if info and info.type == "file" then
            local data = love.filesystem.read(src)
            if data then
                love.filesystem.write(dst, data)

                local check = love.filesystem.getInfo(dst)
                if check and check.type == "file" then
                    love.filesystem.remove(src)
                    stashed_any = true
                end
            end
        end
    end

    if stashed_any then
        love.filesystem.write(marker, "ok")
    end
end

function Mod:intermissionReached()
    if Mod:ch7Reached() then return false end
    local save_path = "saves/" .. Mod.info.id
    local reset_file = love.filesystem.getInfo(save_path .. "/reset.json") ~= nil
    return reset_file;
end

function Mod:ch7Reached()
    local save_path = "saves/" .. Mod.info.id
    local ch7_file = love.filesystem.getInfo(save_path .. "/chapter7.json") ~= nil
    return ch7_file;
end

---@return Video
function Mod:video(id, callback)
    local video = Video(id)
    local callback_obj = Callback({
        update = function (cbk)
            if not video:isPlaying() then
                if callback and callback(video, cbk) == false then return end
                video:remove()
            end
        end
    })
    video:addChild(callback_obj)
    video.x = SCREEN_WIDTH/2
    video.origin_x = 0.5
    return video
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
    if char.world and char.world.map and char.world.map.data and char.world.map.data.properties.step_sound then
        local player_only, step_sound = Utils.startsWith(char.world.map.data.properties.step_sound, "player:")
        if player_only and not char.is_player then return end
        local sound_path = "steps/"..step_sound .. Utils.clampWrap(num, 2)
        print(sound_path)
        Assets.playSound(sound_path)
    end
end

