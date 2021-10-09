uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency;
uniform float uTime;

attribute vec3 position;
attribute vec2 uv;
// attribute float aRandom; 
varying vec2 vUv;
varying float vElavation;
// varying float vRandom;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elavation = sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    elavation += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;

    modelPosition.z += elavation;
    // modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vUv = uv;
    vElavation = elavation;

    // vRandom = aRandom; 
}