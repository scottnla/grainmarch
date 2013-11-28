char fragmentShaderCode[] = R"(

//Based off of MG-raymarching: https://glsl.heroku.com/e#11074.0

#ifdef GL_ES
precision highp float;
#endif

uniform float iGlobalTime;
uniform float iResolutionX;
uniform float iResolutionY;
uniform float SpeedX;
uniform float SpeedY;
uniform float SpeedZ;
uniform float LengthX;
uniform float LengthY;
uniform float LengthZ;
uniform float OffsetX;
uniform float OffsetY;
uniform float FieldOfView;

#define MIN	0.0
#define MAX	50.0
#define DELTA	0.01
#define ITER	1000

float sphere(vec3 p, float r) {
      p = mod(p,2.0)-0.5*2.0;
      return length(p)-r;
}

float sdBox( vec3 p, vec3 b )
{
	p = mod(p,2.0)-0.5*2.0;
	vec3 d = abs(p) - b;
	return min(max(d.x,max(d.y,d.z)),0.0) + length(max(d,0.0));
}

float castRay(vec3 o,vec3 d) {
      float delta = MAX;
      float t = MIN;
      for (int i = 0;i <= ITER;i += 1) {
      	  vec3 p = o+d*t;
	       delta = sdBox(p,vec3(LengthX, LengthY, LengthZ));

	       	     t += delta;
		       if (t > MAX) {return MAX;}
		       	  if (delta-DELTA <= 0.0) {return float(i);}
			  }
			  return MAX;
}

void main() {
     vec2 resolution = vec2(iResolutionX, iResolutionY);
     vec2 p=(gl_FragCoord.xy/resolution.xy);
     p.x-=OffsetX;
     p.y-=OffsetY;
     vec3 o = vec3(SpeedX*iGlobalTime, SpeedY*iGlobalTime, SpeedZ*iGlobalTime);
     vec3 d = normalize(vec3(p.x,p.y,FieldOfView));
     
     float t = castRay(o,d);
     vec3 rp = o+d*t;
     
     if (t < MAX) {
     	t = 1.0-t/float(MAX);
	  gl_FragColor = vec4(t,t,t,1.0);
	  }
	  else {
	       gl_FragColor = vec4(0.0,0.0,0.0,1.0);
	       }
}

)";