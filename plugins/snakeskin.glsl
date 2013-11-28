char fragmentShaderCode[] = R"(

#ifdef GL_ES
precision highp float;
#endif

uniform float iGlobalTime;
uniform float iResolutionX;
uniform float iResolutionY;
uniform float FreqStart; //1 - 100
uniform float NumberOfHarmonics; // 1 - 25
uniform float HarmonicOffset; //typically 0; goes up to 25;
uniform float PhaseOffset; //0 - 1
uniform float Scale; //0-1
uniform float Speed; //0 - 5.0, 2.5
uniform float Luminosity; //0 - 1000;

float time;

vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main( void )
{
	vec2 resolution = vec2(iResolutionX, iResolutionY);
	vec2 uPos = ( gl_FragCoord.xy / resolution.xy );
	
	uPos.x -= 0.5;
	uPos.y -= 0.5;
	
	vec3 color = vec3(0.0);
	float vertColor = 0.0;
	for(float i = HarmonicOffset; i < HarmonicOffset + NumberOfHarmonics; ++i ) {
		  float t = iGlobalTime * (2.5);
		  uPos.y += sin( uPos.x*(i+FreqStart) + t + PhaseOffset*i ) * Scale;
		  float fTemp = abs(1.0 / uPos.y / Luminosity);
		  vertColor += fTemp;
		  color += vec3( fTemp*(10.0-i)/5.0, fTemp*i/10.0, pow(fTemp,0.99)*4.5 );
	}				       
	vec4 color_final = vec4(color, 2.0);
	gl_FragColor = color_final;
	time += 1.0;
}

)";