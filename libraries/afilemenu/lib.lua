local lib = {}

function lib:init()
    if Kristal.getLibConfig("afilemenu", "hookOverlay") then
        Utils.hook(Kristal.Overlay, "update", function (orig, self)
            local do_orig = true
            if love.keyboard.isDown("escape") and not self.quit_release then
                if Kristal.Config and Kristal.Config["instantQuit"] then
                    if Mod ~= nil then
                        self.quit_release = true
                        if Kristal.getModOption("hardReset") then
                            love.event.quit("restart")
                        else
                            Kristal.returnToMenu()
                        end
                    else
                        love.event.quit()
                    end
                else
                    if self.quit_alpha < 1 then
                        self.quit_alpha = math.min(1, self.quit_alpha + DT / 0.75)
                    end
                    self.quit_timer = self.quit_timer + DT
                    if self.quit_timer > 1.2 then
                        if Game.world and Game.world.map and Game.world.map.id == "fileselect" then
                            if Kristal.getModOption("hardReset") then
                                love.event.quit("restart")
                            else
                                Kristal.returnToMenu()
                            end
                        else
                            Game:load(nil,nil,true)
                        end
                        self.quit_timer = 0
                        self.quit_alpha = 0
                        self.quit_release = true
                        do_orig = false
                    else
                        self.quit_timer = self.quit_timer - DT
                    end
                end
            else
                self.quit_timer = 0
                if self.quit_alpha > 0 then
                    self.quit_alpha = math.max(0, self.quit_alpha - DT / 0.25)
                end
            end
    
            if self.quit_release and not love.keyboard.isDown("escape") then
                self.quit_release = false
            end
            if do_orig then
                orig(self)
            end
        end)
    end
end

function lib:getPaletteColor(key)
    local style = "normal"
    if Game.world and Game.world.map then
        style = Game.world.map.menustyle
    end
    local function bystyle(table)
        return table[style] or table.default
    end
    if key == "filemenu_deselected" then
        return bystyle{
            default = {0.6, 0.6, 0.7},
            DEVICE = {0, 0.5, 0},
            greatdoor = {.7, .6, .6},
        }
    elseif key == "filemenu_selected" then
        return bystyle {
            default = {1, 1, 1},
            DEVICE = {0,1,0}
        }
    elseif key == "filemenu_header" then
        return bystyle {
            default = {1, 1, 1},
            DEVICE = {0,.5,0}
        }
    elseif key == "filemenu_copy" then
        return bystyle {
            default = {1, 1, 0.4},
            DEVICE = {0.5,1,0.5}
        }
    elseif key == "filemenu_settings" then
        return bystyle {
            default = {1, 1, 1},
            DEVICE = {0.4,1.0,0.2}
        }
    end
    MUSIC_PITCHES.menu = 0.95
    MUSIC_PITCHES.mod_menu = 0.95
end

return lib
