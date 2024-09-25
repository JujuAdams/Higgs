// Feather disable all

if (keyboard_check_pressed(vk_escape))
{
    instance_destroy();
}
else if (keyboard_check_pressed(vk_enter))
{
    EffectLoad(oDocument.effectArray[0]);
    instance_destroy();
}