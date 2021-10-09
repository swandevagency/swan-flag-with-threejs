
precision mediump float;
uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;
varying float vElavation;   

// varying float vRandom;

void main()
{
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElavation * 1.0 + 1.0;
    gl_FragColor = textureColor;
}