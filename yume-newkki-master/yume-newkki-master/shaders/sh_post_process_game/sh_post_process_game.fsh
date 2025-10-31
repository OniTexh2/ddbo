//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 Texel;
uniform float Split;

vec4 tex(float u, float v)
{
    return texture2D(gm_BaseTexture, v_vTexcoord + vec2(u,v));
}

void main()
{
	vec4 base_col = vec4(tex(Split,0.0).r,tex(0.0,0.0).g,tex(0.0,0.0).b,1.0);
    gl_FragColor = v_vColour * base_col;
}
