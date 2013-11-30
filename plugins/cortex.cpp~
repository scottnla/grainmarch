//
//  cortex.cpp
//  cortexFFGL
//
//  Created by Nathan Lachenmyer
//
//

#include "PluginDefinition.h"
#include "cortex.glsl"
#include "default_vertex_shader.glsl"

DECLARE_PLUGIN(SourcePlugin, 
	       "CRTX", 
	       "cortex", 
	       "form constant visual synthesizer",
	       "by Nathan Lachenmyer");

// Parameter(uniform name, minimum value, maximum value, default value, optional type (default standard/float.))

BEGIN_SHADER_PARAMETERS()
    PARAM("sVert", 0.0, 1.0, 0.0)
    PARAM("sHorizon", 0.0, 1.0, 0.0)
    PARAM("sDiag", 0.0, 1.0, 0.0)
    PARAM("sDiagAlt", 0.0, 1.0, 0.0)
    PARAM("sArms", 0.0, 1.0, 0.0)
    PARAM("sRings", 0.0, 1.0, 1.0)
    PARAM("sSpiral", 0.0, 1.0, 0.0)
    PARAM("sSpiralAlt", 0.0, 1.0, 0.0)
    PARAM("vertPeriod", -20.0, 10.0, 4.0)
    PARAM("horizonPeriod", -20.0, 20.0, 4.0)
    PARAM("diagPeriod", -20.0, 20.0, 4.0)
    PARAM("diagAltPeriod", -20.0, 20.0, 4.0)
    PARAM("armPeriod", -20.0, 20.0, 4.0)
    PARAM("ringPeriod", -20.0, 20.0, 4.0)
    PARAM("spiralPeriod", -20.0, 20.0, 4.0)
    PARAM("spiralAltPeriod", -20.0, 20.0, 4.0)
    PARAM("numVert", 0.0, 100.0, 40.0)
    PARAM("numHorizon", 0.0, 100.0, 40.0)
    PARAM("numDiag", 0.0, 100.0, 40.0)
    PARAM("numDiagAlt", 0.0, 100.0, 40.0)
    PARAM("numArms", 0.0, 24.0, 4.0)
    PARAM("numRings", 0.0, 24.0, 4.0)
    PARAM("numSpiral", 0.0, 24.0, 4.0)
    PARAM("numSpiralAlt", 0.0, 24.0, 4.0)
END_SHADER_PARAMETERS()
