// Feather disable all

function ModalCreateSwitchProject()
{
    with(oModalParent) instance_destroy();
    
    return instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, "Modals", oModalSwitchProject);
}