local map, super = Class(Map)

function map:onEnter()

    for _, chara in ipairs(self.world.followers) do
        chara:remove()
    end
    ---@type PaletteFX
    local fx = self.world.player.sprite:getFX(PaletteFX)
    for index, value in ipairs(fx.live_pal) do
        local l = math.max(value[1], value[2], value[3])
        l = l ^ 3
        l = l * 0.8
        local a = value[4]
        if l < 0.2 then
            a = .5
        end
        fx.live_pal[index] = {l,l,l,a}
    end

    local basket = self:getImageLayer("basket") ---@type Sprite
    basket:addFX(ShaderFX(love.graphics.newShader[[
vec4 effect( vec4 color, sampler2D texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex_col = Texel(texture, texture_coords);
    float brightness = (tex_col.r + tex_col.g + tex_col.b) / 3.0;
    return vec4(brightness, brightness, brightness, tex_col.a) * color;
}
]])).priority = -1230
    basket:setColor(4/10, 4/10, 4/10)
end

return map