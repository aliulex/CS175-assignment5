#version 330

const float PI = 3.14159265358979323;

uniform sampler2D objTexture;
uniform sampler2D envTexture;
uniform float textureBlend;
uniform mat4 myViewMatrix;
uniform vec3 lightPos;
uniform int useDiffuse;

in vec3 worldPos;
in vec3 objNormal;
in vec3 objPos;
in vec3 worldNormal;

out vec4 outputColor;

vec2 sphericalUV(vec3 p) {
    vec2 uv;
    uv.x = atan(p.z, p.x) * .5;
    uv.y = acos(p.y / length(p));
    return uv / PI;
}

void main()
{
	vec3 worldRay = normalize(worldPos);

	vec3 worldReflect = reflect(worldRay, objNormal); 
	vec3 objReflect = inverse(mat3(myViewMatrix)) * normalize(worldReflect);
    vec3 lightDir = normalize(lightPos);

    float diffuse = useDiffuse == 1 ? dot(lightDir, worldNormal) : 1.0;

    vec4 objectColor = texture(objTexture, sphericalUV(objPos));
    vec4 reflectionColor = texture(envTexture, sphericalUV(objReflect));  
    outputColor = diffuse * mix(reflectionColor, objectColor, textureBlend);
}
