//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "raymarch.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "RAYM", "raymarch", "Raymarch", "by Nathan Lachenmyer, modified from glsl.heroku.com")

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
    PARAM("SpeedX", -10.0, 10.0, 0.0)
    PARAM("SpeedY", -10.0, 10.0, 0.0)
    PARAM("SpeedZ", -10.0, 10.0, 1.0)
    PARAM("LengthX", 0.0, 1.0, 0.5)
    PARAM("LengthY", 0.0, 1.0, 0.5)
    PARAM("LengthZ", 0.0, 1.0, 0.5)
    PARAM("OffsetX", -1.0, 1.0, 0.5)
    PARAM("OffsetY", -1.0, 1.0, 0.5)
    PARAM("FieldOfView", 0.01, 5.0, 1.0)
END_SHADER_PARAMETERS()


