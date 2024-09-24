// Feather disable all

if (instance_exists(inHandle))
{
    if (inHandle.edge == id)
    {
        inHandle.edge = noone;
    }
}

if (instance_exists(outHandle))
{
    var _index = array_get_index(outHandle.edgeArray, id);
    if (_index >= 0) array_delete(outHandle.edgeArray, _index, 1);
}