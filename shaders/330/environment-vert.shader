#version 330

uniform mat4 myProjectionMatrix;
uniform mat4 myViewMatrix;
in vec3 myNormal;
in vec3 myPosition;
out vec3 objPos;

void main()
{
	objPos = myPosition;
	vec3 tmpPos = myPosition * 7;
	gl_Position = myProjectionMatrix * myViewMatrix * vec4(tmpPos, 1.0);
}

