---@class FileSelectBackground: Object
---@overload fun(): FileSelectBackground
local FileSelectBackground, super = Class(Object)

function FileSelectBackground:init()
    super.init(self, 0,0, 100,100)
    self.BACKGROUND_SHADER = love.graphics.newShader([[
        extern number bg_sine;
        extern number bg_mag;
        extern number wave_height;
        extern number sine_mul;
        extern vec2 texsize;
        vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
        {
            number i = texture_coords.y * texsize.y;
            number bg_minus = ((bg_mag * (i / wave_height)) * 1.3);
            number wave_mag = max(0.0, bg_mag - bg_minus);
            vec2 coords = vec2(max(0.0, min(1.0, texture_coords.x + (sine_mul * sin((i / 8.0) + (bg_sine / 30.0)) * wave_mag) / texsize.x)), max(0.0, min(1.0, texture_coords.y + 0.0)));
            return Texel(texture, coords) * color;
        }
    ]])
    self.background_image_wave = Assets.getTexture("kristal/title_bg_wave")
    self.background_image_animation = Assets.getFrames("kristal/title_bg_anim")
    self.animation_sine = 0
    self.background_alpha = 1
    self.background_fade = 0.7
    self.giantdarkdoor = Assets.getTexture("fileselect/giantdarkdoor")
    Kristal.callEvent("afmCreateBackground", self)
end

function FileSelectBackground:draw()
    super.draw(self)
    if self["draw_"..Game.world.map.menustyle] then
        self["draw_"..Game.world.map.menustyle](self)
    end
end

function FileSelectBackground:draw_normal()
    -- We need to draw the background on a canvas
    local bg_canvas = Draw.pushCanvas(320, 240)
    love.graphics.clear(0, 0, 0, 1)
    love.graphics.translate(0,10)

    -- Set the shader to use
    love.graphics.setShader(self.BACKGROUND_SHADER)
    self.BACKGROUND_SHADER:send("bg_sine", self.animation_sine)
    self.BACKGROUND_SHADER:send("bg_mag", 6)
    self.BACKGROUND_SHADER:send("wave_height", 240)
    self.BACKGROUND_SHADER:send("texsize",
        { self.background_image_wave:getWidth(), self.background_image_wave:getHeight() })

    self.BACKGROUND_SHADER:send("sine_mul", 1)
    Draw.setColor(1, 1, 1, self.background_alpha * 0.8)
    Draw.draw(self.background_image_wave, 0, math.floor(-10 - (self.background_alpha * 20)))
    self.BACKGROUND_SHADER:send("sine_mul", -1)
    Draw.draw(self.background_image_wave, 0, math.floor(-10 - (self.background_alpha * 20)))
    Draw.setColor(1, 1, 1, 1)

    love.graphics.setShader()

    self:drawAnimStrip(self.background_image_animation, (self.animation_sine / 12), 0,
        (((10 - (self.background_alpha * 20)) + 240) - 70), (self.background_alpha * 0.46))
    self:drawAnimStrip(self.background_image_animation, ((self.animation_sine / 12) + 0.4), 0,
        (((10 - (self.background_alpha * 20)) + 240) - 70), (self.background_alpha * 0.56))
    self:drawAnimStrip(self.background_image_animation, ((self.animation_sine / 12) + 0.8), 0,
        (((10 - (self.background_alpha * 20)) + 240) - 70), (self.background_alpha * 0.7))

    -- Reset canvas to draw to
    Draw.popCanvas()

    -- Draw the canvas on the screen scaled by 2x
    Draw.setColor(1, 1, 1, self.background_fade)
    -- Draw.draw(bg_canvas, 0, 0, 0, 2, 2)
    Draw.draw(bg_canvas, 0, 0, 0, 2, 2)
end

function FileSelectBackground:draw_greatdoor()
    love.graphics.push()
    love.graphics.translate(-142,0)
    love.graphics.scale(2)
    Draw.setColor(COLORS.white(
        (0.03 + (math.sin(self.animation_sine / 20)) * 0.04)
    ))
    Draw.draw(self.giantdarkdoor, 43, 48, 0, 2,2)
    Draw.draw(self.giantdarkdoor, 47, 48, 0, 2,2)
    Draw.draw(self.giantdarkdoor, 43, 52, 0, 2,2)
    Draw.draw(self.giantdarkdoor, 47, 52, 0, 2,2)
    Draw.setColor(COLORS.white(0.25))
    Draw.draw(self.giantdarkdoor, 45, 50, 0, 2,2)
    love.graphics.pop()
end

function FileSelectBackground:drawAnimStrip(sprite, subimg, x, y, alpha)
    Draw.setColor(1, 1, 1, alpha)

    local index = #sprite > 1 and ((math.floor(subimg) % (#sprite - 1)) + 1) or 1

    Draw.draw(sprite[index], math.floor(x), math.floor(y))
end

function FileSelectBackground:update()
    super.update(self)
    self.animation_sine = self.animation_sine + (1 * DTMULT)
end

return FileSelectBackground