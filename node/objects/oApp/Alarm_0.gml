// Feather disable all

var _recentData = RecentDataLoad();
var _path = _recentData[$ "projectPath"];

if (_path == undefined)
{
    ModalCreateHelp(undefined, undefined, ModalCreateSwitchProject);
}
else
{
    if (not file_exists(_path))
    {
        ModalCreateMessage($"Could not find {_path}", undefined, undefined, ModalCreateSwitchProject);
    }
    else
    {
        DocumentLoad(_path);
    }
}