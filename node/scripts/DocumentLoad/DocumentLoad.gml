// Feather disable all

/// @param path

function DocumentLoad(_path)
{
    var _instance = instance_create_layer(0, 0, "Instances", oDocument, { path: _path });
    
    //We loaded successfully, save this project path for later
    RecentDataSave({
        projectPath: _path,
    });
    
    ModalCreateMessage($"Loaded {_path}")
}