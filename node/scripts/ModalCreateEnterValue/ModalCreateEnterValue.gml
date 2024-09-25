// Feather disable all

/// @param constantHandle
/// @param [x]
/// @param [y]

function ModalCreateEnterValue(_constantHandle, _x = display_get_gui_width()/2, _y = display_get_gui_height()/2, _executeAfter = undefined)
{
    with(oModalParent) instance_destroy();
    
    return instance_create_layer(_x, _y, "Modals", oModalEnterValue, { constantHandle: _constantHandle, executeAfter: _executeAfter });
}