// Feather disable all

var _recentData = RecentDataLoad();
var _path = _recentData[$ "projectPath"];

if (_path == undefined)
{
    ModalCreateSwitchProject();
}
else
{
    if (not file_exists(_path))
    {
        ModalCreateMessage($"Could not find {_path}")
    }
    else
    {
        DocumentLoad(_path);
    }
}