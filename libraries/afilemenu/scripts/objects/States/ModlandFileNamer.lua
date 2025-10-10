---@class ModlandFileNamer : StateClass
---
---@field menu FileSelectMenu
---
---@field file_namer FileNamer
---
---@overload fun(menu:FileSelectMenu) : ModlandFileNamer
local ModlandFileNamer, super = Class(StateClass)

function ModlandFileNamer:init(menu)
    self.menu = menu
end

function ModlandFileNamer:registerEvents()
    self:registerEvent("enter", self.onEnter)
    self:registerEvent("leave", self.onLeave)
    self:registerEvent("draw", self.draw)
end

-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------

function ModlandFileNamer:onEnter(old_state)
    local mod = Mod.info

    self.file_namer = (UnderFileNamer or FileNamer)({
        name = mod.nameInput ~= "force" and string.sub(Kristal.Config["defaultName"], 1, mod["nameLimit"] or 12),
        limit = mod["nameLimit"] or 12,

        mod = mod,
        white_fade = mod.whiteFade ~= false and not mod.transition,

        on_confirm = function(name)
            -- Kristal.loadMod(mod.id, self.menu.file_select.selected_y, name)
            Game.playtime = 0
            self.file_namer:remove()
            Game.save_id = self.menu.file_select.selected_y
            Game.save_name = name
            Game.world:loadMap(Kristal.getLibConfig("afilemenu", "map"))
            Kristal.callEvent("afmPostInit", true)

            if mod.transition then
                self.file_namer.name_preview.visible = false
                self.file_namer.text:setText("")
            elseif self.file_namer.do_fadeout then
                -- Game.world.fader:fadeOut{speed = 0.5, color = {0, 0, 0}}
            else
                Game.world.fader.fade_color = {0, 0, 0}
                Game.world.fader.alpha = 1
            end
        end,

        on_cancel = function()
            self.menu:popState()
        end
    })
    self.file_namer.layer = 50

    self.menu.stage:addChild(self.file_namer)

    self.menu.heart.visible = false
end

function ModlandFileNamer:onLeave(new_state)
    self.file_namer:remove()
    self.file_namer = nil

    self.menu.heart.visible = true
end

function ModlandFileNamer:draw()
    local mod_name = string.upper(Mod.info.name or Mod.info.id)
    Draw.printShadow(mod_name, 16, 8)
end

return ModlandFileNamer
