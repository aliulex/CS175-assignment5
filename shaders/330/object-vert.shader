#version 330

uniform mat4 myProjectionMatrix;
uniform mat4 myModelMatrix;
uniform mat4 myViewMatrix;
uniform vec3 lightPos;
in vec3 myNormal;
in vec3 myPosition;
out vec3 vertexPos_CameraCoord;
out vec3 vertexNormal_CameraCoord;
out vec3 vertexPos_objCoord;
out vec3 lightPos_objCoord;
out vec3 normal_worldCoord;

void main()
{
    vec4 worldPos = myProjectionMatrix * myViewMatrix * myModelMatrix * vec4(myPosition, 1.0);
	gl_Position = worldPos;

    vertexPos_CameraCoord = vec3(myViewMatrix * myModelMatrix * vec4(myPosition, 1.0));
    vertexNormal_CameraCoord = vec3(normalize(myViewMatrix * myModelMatrix * vec4(myNormal, 0.0)));
    vertexPos_objCoord = myPosition;
    lightPos_objCoord  = (myModelMatrix * vec4(lightPos, 1.0)).xyz;
    normal_worldCoord  = vec3(transpose(inverse(myModelMatrix)) * vec4(myNormal, 1.0));
}

