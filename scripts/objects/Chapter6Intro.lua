---@class Chapter6Intro: Object
---@overload fun(...): Chapter6Intro
local Chapter6Intro, super = Class(Object)

function Chapter6Intro:init()
    super.init(self)
    self.logo_texture = Assets.getTexture("objects/bumper/deltarunelogo")
    self.gonerbg = AdvancedGonerBackground()
    self.gonerbg.initialized = true
    self.gonerbg.alpha = 1.8
    self:addChild(self.gonerbg)
    self.gonerbg:addFX(MaskFX(self))
    self.sound = love.audio.newSource(Assets.getMusicPath("bumper"), "stream")
    self.timer = self:addChild(Timer())
    self.palette_shader = Assets.newShader("palette")
    self.palette_shader:send("base_palette", {1,1,1,1}, {1,0,0,1})
    self.palette_shader:send("live_palette", {51/255, 8/255, 46/255, 1}, {176/255, 50/255, 70/255, 1})
    self.text_chapter6 = {"CHAPTER"," 6"}
    self.text_chapter6_prog = 0
    self.orange = false
    self.font = Assets.getFont("main",32)
end

function Chapter6Intro:onAddToStage(stage)
    super.onAddToStage(self,stage)
    self.timer:script(function (wait)
        local function waitmus(bar, beat)
            while (((self.sound:tell()/(60/130))/4)+1) < bar + (beat/4) do
                wait(0)
            end
        end
        wait(2)
        self.sound:play()
        waitmus(10, 1.5)
        self.gonerbg.visible = false
        waitmus(10, 2)
        self.orange = true
        waitmus(10, 2.5)
        self.text_chapter6_prog = 1
        waitmus(10, 3)
        self.text_chapter6_prog = 2
    end)
end

function Chapter6Intro:drawMask()
    self:drawLogo()
end

function Chapter6Intro:drawLogo(x, y)
    Draw.draw(self.logo_texture, (SCREEN_WIDTH/2) + (x or 0), (SCREEN_HEIGHT/2) + (y or 0), 0, 2, 2, self.logo_texture:getWidth()/2, self.logo_texture:getHeight())
end

function Chapter6Intro:drawPartialText(x, y, sx, sy, ox, group, progress)
    love.graphics.push()
    love.graphics.translate(x,y)
    love.graphics.scale(sx,sy)
    local full_text = table.concat(group, "")
    local visible_text = table.concat(group, "", 1, progress)
    local text_width = self.font:getWidth(full_text)
    love.graphics.print(visible_text, -text_width*ox, 0)
    love.graphics.pop()
end

function Chapter6Intro:draw()
    love.graphics.clear(0,0,0,1)
    love.graphics.setFont(self.font)
    if self.orange then
        Draw.setColor(1, 177/255, 94/255)
        self:drawLogo(-6, 0)
        self:drawLogo(0, -6)
        self:drawLogo(6, 0)
        self:drawLogo(0, 6)
        self:drawLogo(-6, 6)
        self:drawLogo(6, -6)
        self:drawLogo(6, 6)
        self:drawLogo(-6, -6)
        love.graphics.setShader(self.palette_shader)
        Draw.setColor(1,1,1)
        self:drawLogo()
        love.graphics.setShader()
    end
    self:drawPartialText(SCREEN_WIDTH/2, (SCREEN_HEIGHT/2)+10, 2, 2, 0.5, self.text_chapter6, self.text_chapter6_prog)
    super.draw(self)
end

return Chapter6Intro