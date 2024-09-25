// Feather disable all

/// @param vertexData

function PreviewDrawVertex(_vertexData)
{
    var _outputStruct = _vertexData.outputStruct;
    
    var _vertexPosition = _outputStruct[$ "outputPosition"];
    if (is_array(_vertexPosition))
    {
        var _x = _vertexPosition[0];
        var _y = _vertexPosition[1];
    }
    else
    {
        var _x = 0;
        var _y = 0;
    }
    
    var _colorVec4 = _outputStruct[$ "outputColor"];
    if (is_array(_colorVec4))
    {
        var _red   = _vertexPosition[0]*255;
        var _green = _vertexPosition[1]*255;
        var _blue  = _vertexPosition[2]*255;
        var _alpha = _vertexPosition[3];
    }
    else
    {
        var _red   = 0;
        var _green = 0;
        var _blue  = 0;
        var _alpha = 1;
    }
    
    draw_vertex_color(_x, _y, make_color_rgb(_red, _green, _blue), _alpha);
}