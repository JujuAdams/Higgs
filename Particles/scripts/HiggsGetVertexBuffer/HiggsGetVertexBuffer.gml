// Feather disable all

/// @param particleCount

function HiggsGetVertexBuffer(_particleCount)
{
    static _vertexBufferMap = __HiggsSystem().__vertexBufferMap;
    
    static _vertexFormat = (function()
    {
        vertex_format_begin();
        vertex_format_add_position_3d();
        vertex_format_add_texcoord();
        return vertex_format_end();
    })();
    
    var _vBuff = _vertexBufferMap[? _particleCount];
    if (_vBuff != undefined) return _vBuff;
    
    var _vBuff = vertex_create_buffer();
    vertex_begin(_vBuff, _vertexFormat);
    
    var _i = 0;
    repeat(_particleCount)
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
    
    _vertexBufferMap[? _particleCount] = _vBuff;
    
    return _vBuff;
}