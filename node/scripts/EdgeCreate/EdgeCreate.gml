// Feather disable all

/// @param inHandle
/// @param outHandle

function EdgeCreate(_inHandle, _outHandle)
{
    with(instance_create_layer(0, 0, "Edges", oEdge, {
        inHandle:  _inHandle,
        outHandle: _outHandle,
    }))
    {
        return id;
    }
}