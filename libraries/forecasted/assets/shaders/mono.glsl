vec4 effect(vec4 drawcolor, Image image, vec2 uvs, vec2 screen_coords) {
    vec4 pixel = Texel(image, uvs);
    pixel.rgb = vec3((pixel.r+pixel.g+pixel.b)/3.0);
    return pixel * drawcolor;
}