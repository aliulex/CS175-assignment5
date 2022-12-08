#version 330

const float PI = 3.14159265358979323;

uniform sampler2D envTexture;
in vec3 objPos;
out vec4 outputColor;

vec2 sphericalUV(vec3 p) {
    vec2 uv;
    uv.x = atan(p.z, p.x) * .5;
    uv.y = acos(p.y / length(p));
    return uv / PI;
}

void main()
{	
	vec2 texCoord = sphericalUV(normalize(objPos));
	outputColor = texture(envTexture, texCoord);
}