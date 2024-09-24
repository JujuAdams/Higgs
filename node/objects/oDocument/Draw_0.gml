// Feather disable all

draw_set_color(c_dkgray);
draw_line_width(0, camera_get_view_y(view_camera[0]), 0, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), viewScale);
draw_line_width(camera_get_view_x(view_camera[0]), 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), 0, viewScale);
draw_set_color(c_white);