#version 330

uniform mat4 myProjectionMatrix;
uniform mat4 myViewMatrix;
in vec3 myNormal;
in vec3 myPosition;
out vec3 objPos;

const float SCALE = 7.0;

void main()
{
	objPos = myPosition;
    vec4 scaledPosition = vec4(myPosition * SCALE, 1.0);
	gl_Position = myProjectionMatrix * myViewMatrix * scaledPosition;
}

