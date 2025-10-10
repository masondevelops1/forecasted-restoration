uniform vec4 mult_color = vec4(1,0,0,1); // initialize to red
vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 pixel_color = Texel(texture, texture_coords);
    return pixel_color * mult_color * color;
}