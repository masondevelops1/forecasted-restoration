uniform float inversion = 0;
// uniform vec3 red_out;
// uniform vec3 blue_out;
// uniform vec3 green_out;
// uniform vec3 hsvmult;
// uniform vec3 hsvadd;


const vec3 red_out    = vec3( 1.000,  0.000,  0.040 );
const vec3 green_out  = vec3( 0.000,  1.000,  0.000 );
const vec3 blue_out   = vec3( 0.250,  0.000,  1.000 );
const vec3 hsvmult    = vec3( 1.000,  1.000,  0.300 );
const vec3 hsvadd     = vec3(-0.010,  0.200, -0.020 );


// From: https://stackoverflow.com/a/17897228/11239398
    // All components are in the range [0…1], including hue.
    vec3 rgb2hsv(vec3 c)
    {
        vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
        vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
        vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

        float d = q.x - min(q.w, q.y);
        float e = 1.0e-10;
        return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
    }

    // All components are in the range [0…1], including hue.
    vec3 hsv2rgb(vec3 c)
    {
        vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
        vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
        return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
    }
//

vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords )
{
    vec4 base_color = Texel(tex, texture_coords);
    vec3 hsv = rgb2hsv(base_color.rgb);
    // return vec4(base_color.xyz, base_color.w);
    if ((hsv.y > 0.16 && hsv.y < 0.17) || /**/ (hsv.y > 0.12 && hsv.y < 0.13)) {
        // hsv.y = hsv.y * 0.4;//+ (pow (1.0-hsv.z, 0.2) - 1.0);
        hsv.y *= 0.5;
        // hsv.x = 0;
        // hsv.y = 1;
        // hsv.z = 1;
    }else{
        hsv.y *= 1.3;
        hsv.z *= 0.9;
    }
    hsv += hsvadd;
    hsv *= hsvmult;
    base_color =vec4(hsv2rgb(hsv), base_color.a);
    vec3 transformed_color = vec3(base_color.rgb);
    transformed_color.r = (base_color.r * red_out.r) + (base_color.g * red_out.g) + (base_color.b * red_out.b);
    transformed_color.g = (base_color.r * green_out.r) + (base_color.g * green_out.g) + (base_color.b * green_out.b);
    transformed_color.b = (base_color.r * blue_out.r) + (base_color.g * blue_out.g) + (base_color.b * blue_out.b);
    return vec4(transformed_color, base_color.a) * color;
}