// Feather disable all

/// @param label
/// @param [x]
/// @param [y]

function ModalCreateMessage(_label, _x = display_get_gui_width()/2, _y = display_get_gui_height()/2, _executeAfter = undefined)
{
    with(oModalParent) instance_destroy();
    
    return instance_create_layer(_x, _y, "Modals", oModalMessage, { label: _label, executeAfter: _executeAfter });
}