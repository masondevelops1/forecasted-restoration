local map, super = Class(Map)

function map:onEnter()
    for _, chara in ipairs(self.world.followers) do
        chara:remove()
    end

    -- Greyscale shader
    local grey_shader = ShaderFX(love.graphics.newShader([[
vec4 effect(vec4 color, sampler2D texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 tex = Texel(texture, texture_coords);
    float b = (tex.r + tex.g + tex.b) / 3.0;
    return vec4(b, b, b, tex.a) * color;
}
]]))

    for _, layer in ipairs(self.layers) do
        if layer.render_type == "tile" or layer.render_type == "sprite" then
            layer:addFX(grey_shader)
        end
    end

    for _, obj in ipairs(self.world.children) do
        if obj ~= self.world.player then
            obj:addFX(grey_shader)
        end
    end

    local basket = self:getImageLayer("basket") ---@type Sprite
    local basket_fx = ShaderFX(love.graphics.newShader([[
vec4 effect( vec4 color, sampler2D texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex_col = Texel(texture, texture_coords);
    float brightness = (tex_col.r + tex_col.g + tex_col.b) / 3.0;
    return vec4(brightness, brightness, brightness, tex_col.a) * color;
}
]]))
    basket_fx.priority = -1230
    basket:addFX(basket_fx)
    basket:setColor(0.4, 0.4, 0.4)
end

return map
