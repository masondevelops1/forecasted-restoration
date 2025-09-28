uniform vec4 shadercolor;// = vec4(1,1,1,1);

vec4 effect(vec4 color, Image image, vec2 uvs, vec2 screen_coords) {
    vec4 pixel = Texel(image, uvs);
    if (pixel.rgb == vec3(0,0,0)) {
        return vec4(0);
    }
    return pixel * shadercolor;
}