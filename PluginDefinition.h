#pragma once

#include <FFGLShader.h>
#include <FFGLPluginSDK.h>
#include <string>
#include <vector>


using namespace std;

class Parameter {
public:
    Parameter(string name, float min, float max, float value, int type = FF_TYPE_STANDARD);
    float GetScaledValue() const;
    
    string Name;
    float Value;
    int Type;
    GLint UniformLocation;
    float RangeMin;
    float RangeMax;
};

class ShaderPlugin :
public CFreeFrameGLPlugin
{
public:
    ShaderPlugin(int nInputs);
    
    virtual ~ShaderPlugin() {}
    virtual void InitParameters();
    virtual void EmitGeometry();
    
	DWORD SetParameter(const SetParameterStruct* pParam);
	DWORD GetParameter(DWORD dwIndex);
	DWORD ProcessOpenGL(ProcessOpenGLStruct* pGL);
    DWORD InitGL(const FFGLViewportStruct *vp);
    DWORD DeInitGL();
    DWORD SetTime(double time);
	

protected:	
	int m_initResources;
	FFGLExtensions m_extensions;
    FFGLShader m_shader;
    
    vector<Parameter> m_parameters;

    double m_startTime;
    double m_time;
    
    GLint m_timeLocation;
    float m_resolution[3];
    GLint m_resolutionLocation;
    
    bool m_HostSupportsSetTime;
    
    int m_nInputs;
    GLint* m_inputTextureLocationArray;
};

class SourcePlugin : public ShaderPlugin
{
public:
    SourcePlugin();
    static int Type;
};

class EffectPlugin : public ShaderPlugin
{
public:
    EffectPlugin();
    static int Type;
};

template <class PluginType>
DWORD __stdcall CreateInstance(CFreeFrameGLPlugin **ppOutInstance)
{
    *ppOutInstance = new PluginType();
    if (*ppOutInstance != NULL)
        return FF_SUCCESS;
    return FF_FAIL;
}

#define DECLARE_PLUGIN(class, id, name, description, about) \
static CFFGLPluginInfo PluginInfo ( \
CreateInstance<class>, id, name, 1, 500, 1, 100, class::Type, description, about);


extern char vertexShaderCode[];
extern char fragmentShaderCode[];

void update_time(double *t, const double t0);


