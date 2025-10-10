---@class ModlandOptions : MainMenuOptions
---@overload fun(menu: FileSelectMenu): ModlandOptions
local ModlandOptions, super = Class(MainMenuOptions)

function ModlandOptions:onKeyPressed(key)
    if Input.isCancel(key) and self.state == "MENU" then
        Assets.stopAndPlaySound("ui_cancel")
        Kristal.saveConfig()
        self.menu:popState()
        return
    end
    local page = self.pages[self.selected_page]
    local options = self.options[page].options
    local max_option = #options + 1
    if Input.isConfirm(key) and self.selected_option == max_option then        
        Assets.stopAndPlaySound("ui_select")
        -- "Back" button
        Kristal.saveConfig()
        self.menu:popState()
        return
    end
    super.onKeyPressed(self,key)
end

function ModlandOptions:draw()
    if Game.world.map.menustyle == "normal" or Kristal.getLibConfig("afilemenu", "noStyledOptions") then
        super.draw(self)
        return
    end
    local menu_font = Assets.getFont("main")

    local page = self.pages[self.selected_page]
    local options = self.options[page].options

    local title = self.options[page].name
    local title_width = menu_font:getWidth(title)

    Draw.setColor(PALETTE["filemenu_deselected"], 0.7)
    Draw.printShadow("( OPTIONS )", 0, 0, 2, "center", 640)

    Draw.setColor(PALETTE["filemenu_deselected"])
    Draw.printShadow(title, 0, 48, 2, "center", 640)

    if self.state == "MENU" and #self.pages > 1 then
        love.graphics.setColor(PALETTE["filemenu_selected"])

        local l_offset, r_offset = 0, 0

        if self.page_scroll_timer > 0 then
            if self.page_scroll_direction == "left" then
                l_offset = -4
            elseif self.page_scroll_direction == "right" then
                r_offset = 4
            end
        end

        if self.selected_page >= #self.pages then
            Draw.setColor(PALETTE["filemenu_deselected"], 0.4)
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end
        Draw.draw(Assets.getTexture("kristal/menu_arrow_right"), 320 + (title_width / 2) + 8 + r_offset, 52, 0, 2, 2)

        if self.selected_page == 1 then
            Draw.setColor(PALETTE["filemenu_deselected"], 0.4)
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end
        Draw.draw(Assets.getTexture("kristal/menu_arrow_left"), 320 - (title_width / 2) - 26 + l_offset, 52, 0, 2, 2)

        Draw.setColor(PALETTE["filemenu_selected"])
    end

    local menu_x = 185 - 14
    local menu_y = 110

    local width = 360
    local height = 32 * 10
    local total_height = 32 * #options

    Draw.pushScissor()
    Draw.scissor(menu_x, menu_y, width + 10, height + 10)

    menu_y = menu_y + self.scroll_y

    for i, option in ipairs(options) do
        local y = menu_y + 32 * (i - 1)

        if self.selected_option == i then
            Draw.setColor(PALETTE["filemenu_selected"])
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end

        Draw.printShadow(option.name, menu_x, y)

        local value_x = menu_x + (32 * 8)
        local value = option.value and option.value(value_x, y) or nil

        if value then
            Draw.printShadow(tostring(value), value_x, y)
        end
    end

    -- Draw the scrollbar background if the menu scrolls
    if total_height > height then
        Draw.setColor({ 0, 0, 0, 0.5 })
        love.graphics.rectangle("fill", menu_x + width, 0, 4, menu_y + height - self.scroll_y)

        local scrollbar_height = (height / total_height) * height
        local scrollbar_y = (-self.scroll_y / (total_height - height)) * (height - scrollbar_height)

        Draw.popScissor()
        Draw.setColor(1, 1, 1, 1)
        love.graphics.rectangle("fill", menu_x + width, menu_y + scrollbar_y - self.scroll_y, 4, scrollbar_height)
    else
        Draw.popScissor()
    end

    if self.selected_option == #options + 1 then
        Draw.setColor(PALETTE["filemenu_selected"])
    else
        Draw.setColor(PALETTE["filemenu_deselected"])
    end

    Draw.printShadow("Back", 0, 454 - 8, 2, "center", 640)

    self.state_manager:draw()
end

return ModlandOptions