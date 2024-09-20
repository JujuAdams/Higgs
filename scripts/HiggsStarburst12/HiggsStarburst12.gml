// Feather disable all

function HiggsStarburst12() constructor
{
    static _system = __HiggsSystem();
    
    static _vertexBuffer = _system.__bufferCache.__size12;
    static _texture      = sprite_get_texture(sHiggsStar, 0);
    static _lifeLength   = 25;
    
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
        
        static _u_vPosition = shader_get_uniform(__shdHiggsStarburst12, "u_vPosition");
        static _u_fSeed     = shader_get_uniform(__shdHiggsStarburst12, "u_fSeed");
        static _u_fLife     = shader_get_uniform(__shdHiggsStarburst12, "u_fLife");
        
        HIGGS_SHADER_SET(__shdHiggsStarburst12);
        shader_set_uniform_f(_u_vPosition, _x, _y);
        shader_set_uniform_f(_u_fSeed, __seed);
        shader_set_uniform_f(_u_fLife, __lifetime / _lifeLength);
        vertex_submit(_vertexBuffer, pr_trianglelist, _texture);
        HIGGS_SHADER_RESET();
        
        return true;
    }
}