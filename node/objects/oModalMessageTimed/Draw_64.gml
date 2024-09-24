// Feather disable all

draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

draw_sprite_ext(sprite_index, image_index, x+4, y+4, image_xscale, image_yscale, image_angle, c_black, 0.4*image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, label);
draw_set_color(c_white);