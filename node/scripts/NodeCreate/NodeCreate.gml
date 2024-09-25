// Feather disable all

/// @param x
/// @param y
/// @param type

function NodeCreate(_x, _y, _type)
{
    var _data = global.nodeTypes[$ _type];
    with(instance_create_layer(_x, _y, "Instances", oNode, { nodeTypeData: variable_clone(_data), nodeType: _type, }))
    {
        return id;
    }
}