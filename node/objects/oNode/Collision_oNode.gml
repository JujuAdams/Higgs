// Feather disable all

if (not dragging && (not other.dragging))
{
    if ((x == other.x) && (y == other.y))
    {
        x += random_range(-1, 1);
        y += random_range(-1, 1);
    }
    else
    {
        motion_add(point_direction(other.x, other.y, x, y), 1);
    }
}