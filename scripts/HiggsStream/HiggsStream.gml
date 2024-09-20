// Feather disable all

function HiggsStream() constructor
{
    static _system = __HiggsSystem();
    
    static _count        = 20;
    static _vertexBuffer = HiggsGetVertexBuffer(_count);
    static _cellUVs      = _system.__cacheCellUVs;
    static _texture      = _system.__cacheTexture;
    
    __seed = __HiggsRandom();
    __time = 0;
    
    __index = 0;
    __particleDataArray = array_create(_count*3, infinity);
    
    
    
    
    
    GetDestroyed = function() //Don't make this static!
    {
        return false;
    }
    
    Destroy = function() //Don't make this static!
    {
        GetDestroyed = function() { return true; }
        Destroy      = function() {}
        Draw         = function() {}
        Stream       = function() {}
    }
    
    Stream = function(_x, _y)
    {
        __particleDataArray[__index  ] = _x;
        __particleDataArray[__index+1] = _y;
        __particleDataArray[__index+2] = __time;
        
        __index = (__index + 3) mod (_count*3);
    }
    
    Draw = function(_x = 0, _y = 0) //Don't make this static!
    {
        ++__time;
        
        static _u_vPosition     = shader_get_uniform(__shdHiggsStream, "u_vPosition");
        static _u_vParticleData = shader_get_uniform(__shdHiggsStream, "u_vParticleData");
        static _u_fSeed         = shader_get_uniform(__shdHiggsStream, "u_fSeed");
        static _u_fTime         = shader_get_uniform(__shdHiggsStream, "u_fTime");
        static _u_vTextureData  = shader_get_uniform(__shdHiggsStream, "u_vTextureData");
        
        HIGGS_SHADER_SET(__shdHiggsStream);
        shader_set_uniform_f(_u_vPosition, _x, _y);
        shader_set_uniform_f_array(_u_vParticleData, __particleDataArray);
        shader_set_uniform_f(_u_fSeed, __seed);
        shader_set_uniform_f(_u_fTime, __time);
        shader_set_uniform_f_array(_u_vTextureData, _cellUVs)
        vertex_submit(_vertexBuffer, pr_trianglelist, _texture);
        HIGGS_SHADER_RESET();
        
        return true;
    }
}