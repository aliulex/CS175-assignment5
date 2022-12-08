#version 330

#define PI 3.1415926535897932384626433832795

uniform mat4 myViewMatrix;
uniform sampler2D objTexture;
uniform sampler2D envTexture;
uniform vec3 lightPos;
uniform float textureBlend;
uniform int useDiffuse;
in vec3 vertexPos_CameraCoord;
in vec3 vertexNormal_CameraCoord;
in vec3 vertexPos_objCoord;
in vec3 normal_worldCoord;
out vec4 outputColor;

vec2 textureLocation(vec3 point) {
	vec2 coord;

	coord.x = -atan(point.x, point.z) / (2.0 * PI) + 0.25f;
	float r = sqrt(pow(point.x, 2) + pow(point.y, 2) + pow(point.z, 2));
	float phi = acos(point.y / r);
	coord.y = phi / PI;
    return coord;
    

	coord.x = -atan(point.x, point.z) / (2.0 * PI) + 0.25f;
	r = sqrt(pow(point.x, 2) + pow(point.y, 2) + pow(point.z, 2));
	phi = acos(point.y / r);
	coord.y = phi / PI;

	return coord;
}

void main()
{
	vec3 incidentRay_CameraCoord = normalize(vertexPos_CameraCoord);

	vec3 objReflect = reflect(incidentRay_CameraCoord, vertexNormal_CameraCoord); 
	vec3 worldReflect = inverse(mat3(myViewMatrix)) * normalize(objReflect);

	float diffuse = 1.0;
	if (useDiffuse == 1) {
		diffuse = dot(normalize(lightPos), normalize(normal_worldCoord));
	}

    vec4 objectColor = texture(objTexture, textureLocation(vertexPos_objCoord));
    vec4 reflectionColor = texture(envTexture, textureLocation(worldReflect));  
    outputColor = diffuse * mix(reflectionColor, objectColor, textureBlend);
}
