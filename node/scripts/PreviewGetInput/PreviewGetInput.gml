// Feather disable all

/// @param name
/// @param dimensions

function PreviewGetInput(_name, _dimensions)
{
    return (global.previewInputStruct[$ _name] ?? array_create(_dimensions, 0));
}