---@class ModlandFileSelect : StateClass
---@field menu FileSelectMenu
---@overload fun(menu: FileSelectMenu): ModlandFileSelect
local ModlandFileSelect, super = Class(StateClass)

function ModlandFileSelect:init(menu)
    self.menu = menu
    self.state = "SELECT"
    self.result_timer = 0
end

function ModlandFileSelect:setState(state, result_text)
    self:setResultText(result_text)
    self.state = state
end

function ModlandFileSelect:registerEvents()
    self:registerEvent("enter", self.onEnter)
    self:registerEvent("leave", self.onLeave)
    self:registerEvent("pause", self.onPause)
    self:registerEvent("resume", self.onResume)
    self:registerEvent("keypressed", self.onKeyPressed)
    self:registerEvent("update", self.update)
    self:registerEvent("draw", self.draw)
end

function ModlandFileSelect:onPause()
    self.container.visible = false
    self.container.active = false
end

function ModlandFileSelect:onResume()
    self.container.visible = true
    self.container.active = true
end

function ModlandFileSelect:onEnter()
    self.files = {}
    self.selected_y = 1
    self.selected_x = 1
    self.threat = 0
    self.container = Object()
    self.menu:addChild(self.container)
    for i = 1, 3 do
        local data = Kristal.loadData("file_" .. i)
        local button = FileButton(self, i, data, 110, 110 + 90 * (i - 1), 422, 82)
        if i == 1 then
            button.selected = true
        end
        table.insert(self.files, button)
        self.container:addChild(button)
    end
    self.bottom_row_heart = { 80, 250, 376 }
    self.chapter_select = Kristal.getLibConfig("afilemenu", "chapterSelect")
    self.previous_chapter = Kristal.getLibConfig("afilemenu", "previousChapter")
end

function ModlandFileSelect:onLeave()
    -- self.menu:removeChild(self.container)
    self.container:remove()
    self.container = nil
end

-- function ModlandFileSelect:onKeyPressed(key, is_repeat)
-- end

function ModlandFileSelect:onKeyPressed(key, is_repeat)
        if Input.isCancel(key) then
            Assets.stopAndPlaySound("ui_cancel", 1, 1)
            if #self.menu.state_manager.state_stack > 0 then
                self.menu.state_manager:popState()
            end
        end
    if is_repeat or self.state == "TRANSITIONING" then
        return true
    end
    if self.focused_button then
        local button = self.focused_button
        if Input.is("cancel", key) then
            button:setColor(1, 1, 1)
            button:setChoices()
            if self.state == "COPY" then
                self.selected_y = self.copied_button.id
                self.copied_button:setColor(1, 1, 1)
                self.copied_button = nil
                self:updateSelected()
            elseif self.state == "ERASE" then
                self.erase_stage = 1
            end
            self.focused_button = nil
            Assets.stopAndPlaySound("ui_cancel")
            return true
        end
        if Input.is("left", key) and button.selected_choice == 2 then
            button.selected_choice = 1
            Assets.stopAndPlaySound("ui_move")
        end
        if Input.is("right", key) and button.selected_choice == 1 then
            button.selected_choice = 2
            Assets.stopAndPlaySound("ui_move")
        end
        if Input.is("confirm", key) then
            if self.state == "SELECT" then
                Assets.stopAndPlaySound("ui_select")
                if button.selected_choice == 1 then
                    local skip_naming = button.data ~= nil
                        or Mod.info.nameInput == "none" or Mod.info.nameInput == false
                        or Kristal.Config["skipNameEntry"] and Mod.info.nameInput ~= "force"

                    if skip_naming then
                        self:setState("TRANSITIONING")
                        local save_name = nil
                        if not button.data and Kristal.Config["skipNameEntry"] and Kristal.Config["defaultName"] ~= "" then
                            save_name = string.sub(Kristal.Config["defaultName"], 1, Mod.info["nameLimit"] or 12)
                        end
                        local id = self.selected_y
                        local fade = true
                        local path = "saves/" .. Mod.info.id .. "/file_" .. id .. ".json"
                        local new_file = not love.filesystem.getInfo(path)
                        if new_file then
                            Game.world:closeMenu()
                            Game.world:loadMap(Kristal.getLibConfig("afilemenu", "map"))
                            Game.save_name = Kristal.Config["defaultName"] or Game.save_name
                        else
                            local data = JSON.decode(love.filesystem.read(path))
                            Game:load(data, id, fade)
                        end
                        Kristal.callEvent("afmPostInit", new_file)
                    else
                        self.menu:pushState("FILENAME")

                        button:setChoices()
                        self.focused_button = nil
                    end
                elseif button.selected_choice == 2 then
                    button:setChoices()
                    self.focused_button = nil
                end
            elseif self.state == "ERASE" then
                if button.selected_choice == 1 and self.erase_stage == 1 then
                    Assets.stopAndPlaySound("ui_select")
                    button:setColor(1, 0, 0)
                    if Game.world.map.menustyle == "DEVICE" then
                        button:setChoices({ "ERASE", "DO NOT" }, "THEN IT WILL BE DESTROYED.")
                    else
                        button:setChoices({ "Yes!", "No!" }, "Really erase it?")
                    end
                    self.erase_stage = 2
                else
                    local result
                    if
                        button.selected_choice == 2 and self.erase_stage == 2
                        and Game.world.map.menustyle == "DEVICE"
                    then
                        self.threat = self.threat + 1
                        if self.threat > 9 then
                            result = "VERY INTERESTING."
                            self.threat = 0
                        else
                            result = "THEN IT WAS SPARED."
                        end
                    end
                    if button.selected_choice == 1 and self.erase_stage == 2 then
                        Assets.stopAndPlaySound("ui_spooky_action")
                        Kristal.eraseData("file_" .. button.id, Mod.info.id)
                        button:setData(nil)
                        result = "Erase complete."
                    else
                        Assets.stopAndPlaySound("ui_select")
                    end
                    button:setChoices()
                    button:setColor(1, 1, 1)
                    self.focused_button = nil
                    self.erase_stage = 1

                    self:setState("SELECT", result)
                    self.selected_x = 2
                    self.selected_y = 4
                    self:updateSelected()
                end
            elseif self.state == "COPY" then
                if button.selected_choice == 1 then
                    Assets.stopAndPlaySound("ui_spooky_action")
                    local data = Kristal.loadData("file_" .. self.copied_button.id, Mod.info.id)
                    Kristal.saveData("file_" .. button.id, data, Mod.info.id)
                    button:setData(data)
                    button:setChoices()
                    self:setState("SELECT", "Copy complete.")
                    self.copied_button:setColor(1, 1, 1)
                    self.copied_button = nil
                    self.focused_button = nil
                    self.selected_x = 1
                    self.selected_y = 4
                    self:updateSelected()
                elseif button.selected_choice == 2 then
                    Assets.stopAndPlaySound("ui_select")
                    button:setChoices()
                    self:setState("SELECT")
                    self.copied_button:setColor(1, 1, 1)
                    self.copied_button = nil
                    self.focused_button = nil
                    self.selected_x = 1
                    self.selected_y = 4
                    self:updateSelected()
                end
            end
        end
    elseif self.state == "SELECT" then
        if Input.is("confirm", key) then
            Assets.stopAndPlaySound("ui_select")
            if self.selected_y <= 3 then
                self:onSelectFile(self:getSelectedFile())
            elseif self.selected_y == 4 then
                if self.selected_x == 1 then
                    self:setState("COPY")
                    self.selected_x = 1
                    self.selected_y = 1
                    self:updateSelected()
                elseif self.selected_x == 2 then
                    self:setState("ERASE")
                    self.erase_stage = 1
                    self.selected_x = 1
                    self.selected_y = 1
                    self:updateSelected()
                elseif self.selected_x == 3 then
                    if self.chapter_select then
                        self:swapIntoMod(self.chapter_select)
                    else
                        Game.state = "EXIT"
                        Game.fader:fadeOut(function()
                            Game:load(nil,nil,true)
                        end)
                    end
                end
            elseif self.selected_y == 5 then
                if self.selected_x == 1 then
                    self.menu:pushState("COMPLETION")
                elseif self.selected_x == 2 then
                    self.menu:pushState("OPTIONS")
                elseif self.selected_x == 3 then
                    Game:returnToMenu()
                end
            end
            return true
        end
        local last_x, last_y = self.selected_x, self.selected_y
        if Input.is("up", key) then self.selected_y = self.selected_y - 1 end
        if Input.is("down", key) then self.selected_y = self.selected_y + 1 end
        if Input.is("left", key) then self.selected_x = self.selected_x - 1 end
        if Input.is("right", key) then self.selected_x = self.selected_x + 1 end
        self.selected_y = Utils.clamp(self.selected_y, 1, 5)
        if not self.chapter_select and not self.previous_chapter and self.selected_y == 5 then
            self.selected_x = 2
        elseif self.selected_y ~= 5 then
        elseif self.chapter_select and self.previous_chapter then
        elseif self.chapter_select and not self.previous_chapter then
            self.selected_x = Utils.clamp(self.selected_x, 2, 3)
        elseif not self.chapter_select and self.previous_chapter then
            self.selected_x = Utils.clamp(self.selected_x, 1, 2)
        end
        if self.selected_y <= 3 then
            self.selected_x = 1
        else
            self.selected_x = Utils.clamp(self.selected_x, 1, 3)
        end
        if last_x ~= self.selected_x or last_y ~= self.selected_y then
            Assets.stopAndPlaySound("ui_move")
            self:updateSelected()
        end
    elseif self.state == "COPY" then
        if Input.is("cancel", key) then
            Assets.stopAndPlaySound("ui_cancel")
            if self.copied_button then
                self.selected_y = self.copied_button.id
                self.copied_button:setColor(1, 1, 1)
                self.copied_button = nil
                self:updateSelected()
            else
                self:setState("SELECT")
                self.selected_x = 1
                self.selected_y = 4
                self:updateSelected()
            end
            return true
        end
        if Input.is("confirm", key) then
            if self.selected_y <= 3 then
                if not self.copied_button then
                    local button = self:getSelectedFile()
                    if button.data then
                        Assets.stopAndPlaySound("ui_select")
                        self.copied_button = self:getSelectedFile()
                        self.copied_button:setColor(1, 1, 0.5)
                        self.selected_y = 1
                        self:updateSelected()
                    else
                        Assets.stopAndPlaySound("ui_cancel")
                        if Game.world.map.menustyle == "DEVICE" then
                            self:setResultText("IT IS BARREN AND CANNOT BE COPIED.")
                        else
                            self:setResultText("It can't be copied.")
                        end
                    end
                else
                    local selected = self:getSelectedFile()
                    if selected == self.copied_button then
                        Assets.stopAndPlaySound("ui_cancel")
                        self:setResultText("You can't copy there.")
                    elseif selected.data then
                        Assets.stopAndPlaySound("ui_select")
                        self.focused_button = selected
                        if Game.world.map.menustyle == "DEVICE" then
                            self.focused_button:setChoices({ "OVERWRITE", "DO NOT" }, "IT WILL BE SUBSUMED.")
                        else
                            self.focused_button:setChoices({ "Yes", "No" }, "Copy over this file?")
                        end
                    else
                        Assets.stopAndPlaySound("ui_spooky_action")
                        local data = Kristal.loadData("file_" .. self.copied_button.id, Mod.info.id)
                        Kristal.saveData("file_" .. selected.id, data, Mod.info.id)
                        selected:setData(data)
                        self:setState("SELECT", "Copy complete.")
                        self.copied_button:setColor(1, 1, 1)
                        self.copied_button = nil
                        self.selected_x = 1
                        self.selected_y = 4
                        self:updateSelected()
                    end
                end
            elseif self.selected_y == 4 then
                Assets.stopAndPlaySound("ui_select")
                self:setState("SELECT")
                if self.copied_button then
                    self.copied_button:setColor(1, 1, 1)
                    self.copied_button = nil
                end
                self.selected_x = 1
                self.selected_y = 4
                self:updateSelected()
            end
            return true
        end
        local last_x, last_y = self.selected_x, self.selected_y
        if Input.is("up", key) then self.selected_y = self.selected_y - 1 end
        if Input.is("down", key) then self.selected_y = self.selected_y + 1 end
        self.selected_x = 1
        self.selected_y = Utils.clamp(self.selected_y, 1, 4)
        if last_x ~= self.selected_x or last_y ~= self.selected_y then
            Assets.stopAndPlaySound("ui_move")
            self:updateSelected()
        end
    elseif self.state == "ERASE" then
        if Input.is("cancel", key) then
            Assets.stopAndPlaySound("ui_cancel")
            self:setState("SELECT")
            self.selected_x = 2
            self.selected_y = 4
            self:updateSelected()
            return true
        end
        if Input.is("confirm", key) then
            if self.selected_y <= 3 then
                local button = self:getSelectedFile()
                if button.data then
                    self.focused_button = button
                    if Game.world.map.menustyle == "DEVICE" then
                        self.focused_button:setChoices({ "YES", "NO" }, "TRULY ERASE IT?")
                    else
                        self.focused_button:setChoices({ "Yes", "No" }, "Erase this file?")
                    end
                    Assets.stopAndPlaySound("ui_select")
                else
                    if Game.world.map.menustyle == "DEVICE" then
                        self:setResultText("BUT IT WAS ALREADY GONE.")
                    else
                        self:setResultText("There's nothing to erase.")
                    end
                    Assets.stopAndPlaySound("ui_cancel")
                end
            elseif self.selected_y == 4 then
                Assets.stopAndPlaySound("ui_select")
                self:setState("SELECT")
                self.selected_x = 2
                self.selected_y = 4
                self:updateSelected()
            end
            return true
        end
        local last_x, last_y = self.selected_x, self.selected_y
        if Input.is("up", key) then self.selected_y = self.selected_y - 1 end
        if Input.is("down", key) then self.selected_y = self.selected_y + 1 end
        self.selected_x = 1
        self.selected_y = Utils.clamp(self.selected_y, 1, 4)
        if last_x ~= self.selected_x or last_y ~= self.selected_y then
            Assets.stopAndPlaySound("ui_move")
            self:updateSelected()
        end
    end

    return true
end

function ModlandFileSelect:onSelectFile(button, slot)
    self.focused_button = button
    if self.focused_button.data then
        if Game.world.map.menustyle == "DEVICE" then
            self.focused_button:setChoices({ "CONTINUE", "BACK" })
        else
            self.focused_button:setChoices({ "Continue", "Back" })
        end
    else
        if Game.world.map.menustyle == "DEVICE" then
            self.focused_button:setChoices({ "BEGIN", "BACK" })
        else
            self.focused_button:setChoices({ "Start", "Back" })
        end
    end
end

function ModlandFileSelect:update()
    if self.result_timer > 0 then
        self.result_timer = Utils.approach(self.result_timer, 0, DT)
        if self.result_timer == 0 then
            self.result_text = nil
        end
    end

    self:updateSelected()

    self.menu.heart_target_x, self.menu.heart_target_y = self:getHeartPos()
end

function ModlandFileSelect:draw()
    local mod_name = Mod.info.chaptername or string.upper((Kristal.getLibConfig("afilemenu", "chaptername").long).." "..(Kristal.getLibConfig("afilemenu", "chapter") or Game.chapter))
    Draw.setColor(PALETTE["filemenu_header"])
    Draw.printShadow(mod_name, 16, 8)
    
    Draw.setColor(PALETTE["filemenu_selected"])
    
    Draw.printShadow(self:getTitle(), 80, 60)
    
    local function setColor(x, y)
        local luma = 1
        if self.selected_x == x and self.selected_y == y then
            Draw.setColor(PALETTE["filemenu_selected"])
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end
    end

    if self.state == "SELECT" or self.state == "TRANSITIONING" then
        setColor(1, 4)
        Draw.printShadow(self:gasterize "Copy", 108, 380)
        setColor(2, 4)
        Draw.printShadow(self:gasterize "Erase", 280, 380)
        if not self.chapter_select then
            setColor(3, 4)
            Draw.printShadow(self:gasterize "Scene Select", self.bottom_row_heart[3] + 28, 380)
        else
            setColor(3, 4)
            Draw.printShadow(self:gasterize "Chapter Select", self.bottom_row_heart[3] + 28, 380)
            setColor(3, 5)
            Draw.printShadow(self:gasterize "Mod Select", self.bottom_row_heart[3] + 28, 380 + 40)
        end
        if self.previous_chapter then
            setColor(1, 5)
            Draw.printShadow(self:gasterize(self.menu.chapter_name.select), 108, 380 + 40)
        end
        setColor(2, 5)
        Draw.printShadow(self:gasterize "Config", self.bottom_row_heart[2] + 28, 380 + 40)
    else
        setColor(1, 4)
        Draw.printShadow(self:gasterize "Cancel", 110, 380)
    end

    Draw.setColor(1, 1, 1)
end

function ModlandFileSelect:getSelectedFile()
    return self.files[self.selected_y], self.selected_y
end

function ModlandFileSelect:updateSelected()
    for i, file in ipairs(self.files) do
        if i == self.selected_y or (self.state == "COPY" and self.copied_button == file) then
            file.selected = true
        else
            file.selected = false
        end
    end
end

function ModlandFileSelect:gasterize(string)
    if type(string) ~= "string" then return string end
    if Game.world.map.menustyle ~= "DEVICE" then
        return string
    end
    local gtable = {
        ["Please select a file."] = "",
        ["Choose a file to copy."] = "CHOOSE THE ONE TO COPY.",
        ["Choose a file to copy to."] = "CHOOSE THE TARGET FOR THE REFLECTION.",
        ["Choose a file to erase."] = "CHOOSE THE ONE TO ERASE.",
        ["You can't copy there."] = "IT IS IMMUNE TO ITS OWN IMAGE.",
        ["Cancel"] = "        CANCEL"
    }
    return gtable[string] or gtable[string:upper()] or string:upper()
end

function ModlandFileSelect:getTitle()
    if self.result_text then
        return self.result_text
    end
    if self.state == "SELECT" or self.state == "TRANSITIONING" then
        return self:gasterize "Please select a file."
    else
        if self.state == "ERASE" then
            return self:gasterize "Choose a file to erase."
        elseif self.state == "COPY" then
            if not self.copied_button then
                return self:gasterize "Choose a file to copy."
            elseif not self.focused_button then
                return self:gasterize "Choose a file to copy to."
            else
                return self:gasterize "The file will be overwritten."
            end
        end
    end
end


function ModlandFileSelect:setResultText(text)
    self.result_text = self:gasterize(text)
    self.result_timer = 3
end

function ModlandFileSelect:swapIntoMod(mod)
    Gamestate.switch({})
    -- Clear the mod
    Kristal.clearModState()

    -- Reload mods and return to memu
    Kristal.loadAssets("", "mods", "", function ()
        Kristal.loadMod(mod)
    end)

    Kristal.DebugSystem:refresh()
    -- End input if it's open
    if not Kristal.Console.is_open then
        TextInput.endInput()
    end
end

function ModlandFileSelect:getHeartPos()
    if self.selected_y <= 3 then
        local button = self:getSelectedFile()
        local hx, hy = button:getHeartPos()
        local x, y = button:getRelativePos(hx, hy)
        return x + 9, y + 9
    elseif self.selected_y >= 4 then
        return self.bottom_row_heart[self.selected_x] + 9, 390 + 9 + (self.selected_y - 4) * 40
    end
end

return ModlandFileSelect