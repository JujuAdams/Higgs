// Feather disable all

/// @param sprite

function HiggsSpriteCache(_sprite)
{
    static _system = __HiggsSystem();
    
    if (not _system.__inSpriteCacheConfig)
    {
        __HiggsError("Must only call HiggsSpriteCache() inside __HiggsConfigSpriteCache()");
    }
    
    __cacheCellWidth  = max(sprite_get_width( _sprite), __cacheCellWidth );
    __cacheCellHeight = max(sprite_get_height(_sprite), __cacheCellHeight);
    array_push(__cacheArray, _sprite);
}