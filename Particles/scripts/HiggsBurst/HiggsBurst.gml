// Feather disable all

function HiggsBurst() constructor
{
    static _system = __HiggsSystem();
    
    static _shader       = __shdHiggsBurst;
    static _vertexBuffer = HiggsGetVertexBuffer(12);
    static _texture      = _system.__cacheTexture;
    static _cellUVs      = _system.__cacheCellUVs;
    static _lifeLength   = 25;
    static _spriteIndex  = HiggsGetSpriteIndex(sStar);
    
    __seed = __HiggsRandom();
    __lifetime = 0;
    
    
    
    
    
    GetDestroyed = function() //Don't make this static!
    {
        return false;
    }
    
    Destroy = function() //Don't make this static!
    {
        GetDestroyed = function() { return true; }
        Destroy      = function() {}
        Draw         = function() {}
    }
    
    Draw = function(_x, _y) //Don't make this static!
    {
        ++__lifetime;
        if (__lifetime >= _lifeLength)
        {
            Destroy();
            return false;
        }
        
        static _u_vPosition    = shader_get_uniform(_shader, "u_vPosition");
        static _u_fSeed        = shader_get_uniform(_shader, "u_fSeed");
        static _u_fLife        = shader_get_uniform(_shader, "u_fLife");
        static _u_vTextureData = shader_get_uniform(_shader, "u_vTextureData");
        static _u_fSpriteIndex = shader_get_uniform(_shader, "u_fSpriteIndex");
        
        HIGGS_SHADER_SET(_shader);
        shader_set_uniform_f(_u_vPosition, _x, _y);
        shader_set_uniform_f(_u_fSeed, __seed);
        shader_set_uniform_f(_u_fLife, __lifetime / _lifeLength);
        shader_set_uniform_f_array(_u_vTextureData, _cellUVs)
        shader_set_uniform_f(_u_fSpriteIndex, _spriteIndex);
        vertex_submit(_vertexBuffer, pr_trianglelist, _texture);
        HIGGS_SHADER_RESET();
        
        return true;
    }
}