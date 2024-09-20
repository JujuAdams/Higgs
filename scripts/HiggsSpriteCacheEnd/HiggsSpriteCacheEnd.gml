// Feather disable all

function HiggsSpriteCacheEnd()
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
        
        var _surface = surface_create(__cacheSurfaceSize, __cacheSurfaceSize);
        surface_set_target(_surface);
        draw_clear_alpha(c_black, 0);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
        var _cellsWidth  = floor(__cacheSurfaceSize / __cacheCellWidth );
        var _cellsHeight = floor(__cacheSurfaceSize / __cacheCellHeight);
        
        var _index = 0;
        var _x = 0;
        var _y = 0;
        
        var _i = 0;
        repeat(array_length(__cacheArray))
        {
            var _sprite = __cacheArray[_i];
            __cacheLookupMap[? _sprite] = _index;
            
            var _j = 0;
            repeat(sprite_get_number(_sprite))
            {
                draw_sprite(_sprite, _j, _x + sprite_get_xoffset(_sprite), _y + sprite_get_yoffset(_sprite));
                
                _x += __cacheCellWidth;
                if (_x >= __cacheSurfaceSize)
                {
                    _x = 0;
                    _y += __cacheCellHeight;
                }
                
                ++_j;
            }
            
            if (_y >= __cacheSurfaceSize)
            {
                __HiggsError("Not enough room on cache surface");
            }
            
            _index += sprite_get_number(_sprite);
            ++_i;
        }
        
        surface_reset_target();
        gpu_set_blendmode(bm_normal);
        
        __cacheSprite = sprite_create_from_surface(_surface, 0, 0, __cacheSurfaceSize, __cacheSurfaceSize, false, false, 0, 0);
        surface_free(_surface);
        
        __cacheTexture = sprite_get_texture(__cacheSprite, 0);
        __cacheCellUVs[0] = texture_get_texel_width( __cacheTexture)*__cacheCellWidth;
        __cacheCellUVs[1] = texture_get_texel_height(__cacheTexture)*__cacheCellHeight;
        __cacheCellUVs[2] = __cacheCellWidth;
    }
}