#version 330

uniform mat4 myProjectionMatrix;
uniform mat4 myViewMatrix;
in vec3 myNormal;
in vec3 myPosition;
out vec3 objPos;

void main()
{
	objPos = myPosition;
	gl_Position = myProjectionMatrix * myViewMatrix * vec4(myPosition * 7, 1.0);
}

