shader_type canvas_item;

uniform float a = 0.0;
uniform float b = 150.;
uniform float c = 84446.0227;

float rand(vec2 co) 
{
  return fract(sin(dot(co.xy, vec2(a, b))) * c);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = FRAGCOORD.xy / iResolution.xy;

    float fft  = texture( iChannel0, vec2(uv.x, 0.2) ).x;

    float r = abs(sin(iTime+fft));
    float g = abs(cos(iTime+fft));
    float b = 1.0;
    vec3 color = vec3(r, g, b); 

    vec2 pos = uv + vec2(cos(iTime), sin(iTime));
    float x = clamp(rand(pos), 0.49, .5) * clamp(uv.y, .1, 1.);
    fragColor = vec4(color * x, 1.);
}