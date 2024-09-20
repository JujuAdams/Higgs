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
        __cacheSurfaceSize = undefined;
        __cacheCellWidth   = 0;
        __cacheCellHeight  = 0;
        __cacheArray       = [];
        
        __cacheLookupMap = ds_map_create();
        __cacheSprite    = undefined;
        __cacheTexture   = undefined;
        __cacheCellUVs   = [0, 0, 1];
        
        __bufferCache = {};
        
        var _funcGenerateVertexBuffer = function(_count)
        {
            static _vertexFormat = undefined;
            if (_vertexFormat == undefined)
            {
                vertex_format_begin();
                vertex_format_add_position_3d();
                vertex_format_add_texcoord();
                _vertexFormat = vertex_format_end();
            }
            
            var _vBuff = vertex_create_buffer();
            vertex_begin(_vBuff, _vertexFormat);
            
            var _i = 0;
            repeat(_count)
            {
                vertex_position_3d(_vBuff, -0.5, -0.5, _i); vertex_texcoord(_vBuff, 0, 0);
                vertex_position_3d(_vBuff,  0.5, -0.5, _i); vertex_texcoord(_vBuff, 1, 0);
                vertex_position_3d(_vBuff, -0.5,  0.5, _i); vertex_texcoord(_vBuff, 0, 1);
                
                vertex_position_3d(_vBuff,  0.5, -0.5, _i); vertex_texcoord(_vBuff, 1, 0);
                vertex_position_3d(_vBuff,  0.5,  0.5, _i); vertex_texcoord(_vBuff, 1, 1);
                vertex_position_3d(_vBuff, -0.5,  0.5, _i); vertex_texcoord(_vBuff, 0, 1);
                
                ++_i;
            }
            
            vertex_end(_vBuff);
            vertex_freeze(_vBuff);
            
            return _vBuff;
        }
        
        __bufferCache.__size3  = _funcGenerateVertexBuffer( 3);
        __bufferCache.__size6  = _funcGenerateVertexBuffer( 6);
        __bufferCache.__size10 = _funcGenerateVertexBuffer(10);
        __bufferCache.__size12 = _funcGenerateVertexBuffer(12);
        __bufferCache.__size17 = _funcGenerateVertexBuffer(17);
    }
    
    return _system;
}