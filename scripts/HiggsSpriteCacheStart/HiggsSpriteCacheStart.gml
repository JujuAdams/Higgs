// Feather disable all

/// @param surfaceSize

function HiggsSpriteCacheStart(_surfaceSize)
{
    static _system = __HiggsSystem();
    
    with(_system)
    {
        if (__cacheSprite != undefined)
        {
            __HiggsError("Already called HiggsSpriteCacheEnd()");
        }
        
        if (__cacheSurfaceSize != undefined)
        {
            __HiggsError("Already called HiggsSpriteCacheStart()");
        }
        
        __cacheSurfaceSize = _surfaceSize;
    }
}