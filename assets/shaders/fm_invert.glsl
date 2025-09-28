uniform float inversion = 0;
vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords )
{
    vec4 base_color = Texel(tex, texture_coords);
    vec4 inverted = vec4(
        (1.0-(base_color.r)),
        (1.0-(base_color.g)),
        (1.0-(base_color.b)),
        base_color.a
    );
    
    return mix(base_color, inverted, inversion) * color;
}