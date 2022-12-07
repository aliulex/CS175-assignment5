#version 330

const float PI = 3.14159;

uniform sampler2D envTexture;
in vec3 objPos;
out vec4 outputColor;

vec2 textureLocation(vec3 pos) {
	float theta = atan(pos.z, pos.x);
    vec2 coord = vec2(theta / (2.0 * PI), acos(pos.y / length(pos)) / PI);
    return coord;
}

void main()
{	
	vec2 texCoord = textureLocation(normalize(objPos));
	outputColor = texture(envTexture, texCoord);
}