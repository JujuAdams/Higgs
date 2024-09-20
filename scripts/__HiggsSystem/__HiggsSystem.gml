// Feather disable all

__HiggsSystem();
function __HiggsSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    
    show_debug_message("Higgs: Welcome to Higgs by Juju Adams! This is version 0.1.0, 2024-04-10");
    
    _system = {};
    with(_system)
    {
        __cacheCellWidth   = 0;
        __cacheCellHeight  = 0;
        __cacheArray       = [];
        
        __cacheLookupMap = ds_map_create();
        __cacheSprite    = undefined;
        __cacheTexture   = undefined;
        __cacheCellUVs   = [0, 0, 1];
        
        __vertexBufferMap = ds_map_create();
        
        //////////////////////////
        //                      //
        //  Build Sprite Cache  //
        //                      //
        //////////////////////////
        
        __inSpriteCacheConfig = true;
        __HiggsConfigSpriteCache();
        __inSpriteCacheConfig = false;
        
        var _surface = surface_create(HIGGS_SPRITE_CACHE_SURFACE_SIZE, HIGGS_SPRITE_CACHE_SURFACE_SIZE);
        surface_set_target(_surface);
        draw_clear_alpha(c_black, 0);
        gpu_set_blendmode_ext(bm_one, bm_zero);
        
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
                if (_x >= HIGGS_SPRITE_CACHE_SURFACE_SIZE)
                {
                    _x = 0;
                    _y += __cacheCellHeight;
                }
                
                ++_j;
            }
            
            if (_y >= HIGGS_SPRITE_CACHE_SURFACE_SIZE)
            {
                __HiggsError("Not enough room on cache surface");
            }
            
            _index += sprite_get_number(_sprite);
            ++_i;
        }
        
        surface_reset_target();
        gpu_set_blendmode(bm_normal);
        
        __cacheSprite = sprite_create_from_surface(_surface, 0, 0, HIGGS_SPRITE_CACHE_SURFACE_SIZE, HIGGS_SPRITE_CACHE_SURFACE_SIZE, false, false, 0, 0);
        surface_free(_surface);
        
        __cacheTexture = sprite_get_texture(__cacheSprite, 0);
        __cacheCellUVs[0] = __cacheCellWidth;
        __cacheCellUVs[1] = __cacheCellHeight;
        __cacheCellUVs[2] = HIGGS_SPRITE_CACHE_SURFACE_SIZE;
    }
    
    return _system;
}