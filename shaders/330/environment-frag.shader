#version 330

#define PI 3.1415926535897932384626433832795

uniform sampler2D envTexture;
in vec3 objPos;
out vec4 outputColor;

vec2 textureLocation(vec3 point) {
	vec2 coord;

	coord.x = atan(point.z, point.x) / (2.0 * PI);
	float r = sqrt(pow(point.x, 2) + pow(point.y, 2) + pow(point.z, 2));
	float phi = acos(point.y / r);
	coord.y = phi / PI;

	return coord;
}

void main()
{	
	vec2 texCoord = textureLocation(objPos);
	outputColor = texture(envTexture, texCoord);
}