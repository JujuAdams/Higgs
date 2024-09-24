// Feather disable all

path = get_open_filename_ext("Project|*.yyp", "project.yyp", GM_project_filename, "Switch Project");

if (not string_pos(".yyp", path))
{
    ModalCreateMessage("No project chosen");
}
else
{
    ModalCreateMessage($"Chose {filename_name(path)}");
    DocumentLoad(path);
}

instance_destroy();