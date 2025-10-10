---@class WorldCutscene : WorldCutscene
local WorldCutscene, super = Utils.hookScript(WorldCutscene)

-- Hard-cuts to a title card. If you want a soft fade, you'll need to do cutscene:fadeIn and cutscene:fadeOut before and after respectively.
---@param act_num 1|2|3 Which act this is.
---@param act_title string The title of the act.
function WorldCutscene:titleCard(act_num, act_title, options)
    options = options or {}
    local bg = Rectangle(0,0,SCREEN_WIDTH, SCREEN_HEIGHT)
    local was_playing = self.world.music:isPlaying()
    if options["pause_music"] ~= false then
        self.world.music:pause()
    end
    bg:setParallax(0,0)
    bg:setColor(COLORS.black)
    bg.debug_select = false
    self.world:spawnObject(bg, WORLD_LAYERS["below_textbox"])
    Assets.playSound("locker")
    local act_sprite = Sprite("objects/ACT"..act_num)
    Game.world:spawnObject(act_sprite)
    act_sprite:setScale(2)
    act_sprite:setLayer(WORLD_LAYERS["above_textbox"])
    act_sprite:setParallax(0)
    act_sprite.x = 210
    act_sprite.y = 150
    self:wait(2)
    Assets.playSound("title card")
    local title_text = Text()
    title_text.align = "center"
    title_text.line_offset = -6
    title_text:setSize((94*2)+4,24*2)
    title_text:setText("[font:main_mono]"..(act_title or "A PECULIAR HAPPENSTANCE"))
    Game.world:spawnObject(title_text)
    title_text:setLayer(WORLD_LAYERS["above_textbox"])
    title_text:setParallax(0)
    title_text.x = 230
    title_text.y = 296
    self:wait(4)
    act_sprite:fadeOutAndRemove(2)
    title_text:fadeOutAndRemove(2)
    self:wait(2)
    bg:remove()
    if options["pause_music"] ~= false and was_playing then
        self.world.music:resume()
    end
end

return WorldCutscene