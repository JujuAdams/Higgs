// Feather disable all

/// @param sprite

function HiggsGetSpriteIndex(_sprite)
{
    static _cacheLookupMap = __HiggsSystem().__cacheLookupMap;
    
    return _cacheLookupMap[? _sprite];
}