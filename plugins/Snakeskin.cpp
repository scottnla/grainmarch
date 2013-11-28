//
//  Grainmarch.cpp
//  GrainmarchFFGL
//
//  Created by Michael Dewberry on 11/21/13.
//
//

#include "PluginDefinition.h"
#include "snakeskin.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, "SNKE", "snakeskin", "snakeskin", "by Nathan Lachenmyer, modified from glsl.heroku.com")

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
PARAM("Time", 0.0, 10.0, 0.0)
PARAM("FreqStart", 1.0, 100.0, 1.0)
PARAM("NumberOfHarmonics", 1.0, 25.0, 1.0)
PARAM("HarmonicOffset", 0.0, 25.0, 0.0)
PARAM("PhaseOffset", 0.0, 1.0, 0.0)
PARAM("Scale", 0.0, 0.1, 0.05)
PARAM("Speed", 0.0, 5.0, 2.5)
PARAM("Luminosity", 250.0, 5000.0, 900.0)
END_SHADER_PARAMETERS()


