// Feather disable all

hspeed *= 0.7;
vspeed *= 0.7;

if (dragging)
{
    x = mouse_x + dragDX;
    y = mouse_y + dragDY;
    
    if (not mouse_check_button(mb_left))
    {
        dragging = false;
    }
}

var _i = 0;
repeat(array_length(inHandleArray))
{
    with(inHandleArray[_i])
    {
        x = other.x + dX;
        y = other.y + dY;
    }
    
    ++_i;
}

var _i = 0;
repeat(array_length(outHandleArray))
{
    with(outHandleArray[_i])
    {
        x = other.x + dX;
        y = other.y + dY;
    }
    
    ++_i;
}