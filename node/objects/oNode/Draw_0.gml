// Feather disable all

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(x, bbox_top + 40, nodeTypeData.label);
draw_set_color(c_white);

var _i = 0;
repeat(array_length(inHandleArray))
{
    with(inHandleArray[_i])
    {
        draw_self();
    }
    
    ++_i;
}

var _i = 0;
repeat(array_length(outHandleArray))
{
    with(outHandleArray[_i])
    {
        draw_self();
    }
    
    ++_i;
}