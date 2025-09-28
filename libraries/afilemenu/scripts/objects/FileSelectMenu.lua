---@class FileSelectMenu: Object
---@field background FileSelectBackground?
---@overload fun(): FileSelectMenu
local FileSelectMenu, super = Class(Object)

function FileSelectMenu:init()
    super.init(self)
    self.heart_target_x, self.heart_target_y = 0,0
    self.state_manager = StateManager("", self, true)
    self:initStateclasses()
    self:initStates()

    self.font = Assets.getFont("main")

    self.heart = Sprite("player/heart_menu")
    self.heart.visible = true
    self.heart:setOrigin(0.5, 0.5)
    self.heart:setScale(2, 2)
    self.heart:setColor(Kristal.getSoulColor())
    self.heart.layer = 100
    self:addChild(self.heart)
    local chapter = Kristal.getLibConfig("afilemenu", "chapter") or Game.chapter
    local chapter_name = Kristal.getLibConfig("afilemenu", "chaptername", true)
    self.chapter_name = Kristal.callEvent("afmGetChapterName") or {
        cancel = "Don't Use "..chapter_name.long.." "..(chapter-1).." FILE",
        select = chapter_name.short.." "..(chapter-1).." Files",
        title = "Start "..chapter_name.long.." "..chapter.." from "..chapter_name.long.." "..(chapter-1).."'s FILE",
        title_DEVICE = "",
    }
end

function FileSelectMenu:initStateclasses()
    self.file_select = ModlandFileSelect(self)
    self.completion_select = ModlandCompletionSelect(self)
    self.file_namer = ModlandFileNamer(self)
    self.options = ModlandOptions(self)
end

function FileSelectMenu:onStateChange(old, new, ...)
    if self.background and self.background.onStateChange then
        return self.background:onStateChange(old, new, ...)
    end
end

function FileSelectMenu:initStates()
    self.state_manager:addState("FILESELECT", self.file_select)
    self.state_manager:addState("FILENAME", self.file_namer)
    self.state_manager:addState("COMPLETION", self.completion_select)
    self.state_manager:addState("OPTIONS", self.options)

    -- OPTIONS substates
    self.state_manager:addState("CONTROLS", MainMenuControls(self--[[@as MainMenu]]))
    self.state_manager:addState("DEFAULTNAME", MainMenuDefaultName(self--[[@as MainMenu]]))
end

function FileSelectMenu:onAddToStage()
    self.state_manager:setState("FILESELECT")
    if not Kristal.hasAnySaves(Mod.info.id) and self.file_select.previous_chapter then
        self:pushState("COMPLETION")
    end
end

function FileSelectMenu:setState(state, ...)
    self.state_manager:setState(state, ...)
end

function FileSelectMenu:pushState(state, ...)
    self.state_manager:pushState(state, ...)
end

function FileSelectMenu:popState(...)
    self.state_manager:popState(...)
end

function FileSelectMenu:draw()
    love.graphics.setFont(self.font)
    self.state_manager:draw()
    super.draw(self)
end

function FileSelectMenu:update()
    super.update(self)
    self.state_manager:update()
    if self.heart.visible then
        if (math.abs((self.heart_target_x - self.heart.x)) <= 2) then
            self.heart.x = self.heart_target_x
        end
        if (math.abs((self.heart_target_y - self.heart.y)) <= 2) then
            self.heart.y = self.heart_target_y
        end
        self.heart.x = self.heart.x + ((self.heart_target_x - self.heart.x) / 2) * DTMULT
        self.heart.y = self.heart.y + ((self.heart_target_y - self.heart.y) / 2) * DTMULT
    end
end

function FileSelectMenu:loadGame(id)
    local path = "saves/" .. Mod.info.id .. "/file_" .. id .. ".json"
    local fade = true
    if love.filesystem.getInfo(path) then
        local data = JSON.decode(love.filesystem.read(path))
        Game:load(data, id, fade)
    else
        Game:load(nil, id, fade)
    end
end

function FileSelectMenu:onKeyPressed(key, is_repeat)
    self.state_manager:call("keypressed", key, is_repeat)
end

function FileSelectMenu:onKeyReleased(key)
    self.state_manager:call("keyreleased", key)
end

return FileSelectMenu