// Feather disable all

nodeTypeData.previewFunc = method(self, nodeTypeData.previewFunc);

dragging = false;
dragDX   = 0;
dragDY   = 0;

uuid = md5_string_utf8(string(ptr(irandom(0xFFFF_FFFF_FFFF_FFFF))));

var _inArray  = nodeTypeData.in;
var _outArray = nodeTypeData.out;

var _handleHeight = 40*max(array_length(_inArray), array_length(_outArray));

var _width  = 220;
var _height = 80 + _handleHeight;

image_xscale = _width  / sprite_get_width( sprite_index);
image_yscale = _height / sprite_get_height(sprite_index);

inHandleArray  = [];
outHandleArray = [];

var _x = bbox_left + 30;
var _y = bbox_bottom - _handleHeight + 10;

var _i = 0;
repeat(array_length(_inArray))
{
    var _handleData = _inArray[_i];
    
    var _handleInstance = instance_create_layer(_x, _y, "Instances", oHandleIn, {
        node: id,
        datatype: _handleData.datatype,
        label: _handleData.label,
        index: _i,
        dX: _x - x,
        dY: _y - y,
    });
    
    array_push(inHandleArray, _handleInstance);
    
    _y += 40;
    ++_i;
}

var _x = bbox_right - 30;
var _y = bbox_bottom - _handleHeight + 10;

var _i = 0;
repeat(array_length(_outArray))
{
    var _handleData = _outArray[_i];
    
    var _handleInstance = instance_create_layer(_x, _y, "Instances", oHandleOut, {
        node: id,
        datatype: _handleData.datatype,
        label: _handleData.label,
        index: _i,
        dX: _x - x,
        dY: _y - y,
    });
    
    array_push(outHandleArray, _handleInstance);
    
    _y += 40;
    ++_i;
}