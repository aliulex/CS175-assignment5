#version 330

uniform mat4 myProjectionMatrix;
uniform mat4 myModelMatrix;
uniform mat4 myViewMatrix;
uniform vec3 lightPos;
in vec3 myNormal;
in vec3 myPosition;
out vec3 worldPos;
out vec3 objNormal;
out vec3 objPos;
out vec3 worldNormal;

void main()
{
    mat4 modelViewMatrix = myViewMatrix * myModelMatrix;
    mat3 modelInverseTranspose = transpose(inverse(mat3(myModelMatrix))); 

    objPos = myPosition;
    worldPos = (modelViewMatrix * vec4(myPosition, 1)).xyz;

    objNormal = normalize((modelViewMatrix * vec4(myNormal, 0)).xyz);
    worldNormal = normalize(modelInverseTranspose * myNormal);

    gl_Position = myProjectionMatrix * modelViewMatrix * vec4(myPosition, 1);
}

