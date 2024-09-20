// Feather disable all

/// @param sprite

function HiggsSpriteCache(_sprite)
{
    static _system = __HiggsSystem();
    
    with(_system)
    {
        if (__cacheSprite != undefined)
        {
            __HiggsError("Already called HiggsSpriteCacheEnd()");
        }
        
        if (__cacheSurfaceSize == undefined)
        {
            __HiggsError("Must call HiggsSpriteCacheStart() first");
        }
        
        __cacheCellWidth  = max(sprite_get_width( _sprite), __cacheCellWidth );
        __cacheCellHeight = max(sprite_get_height(_sprite), __cacheCellHeight);
        array_push(__cacheArray, _sprite);
    }
}