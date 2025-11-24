
txt = global.text.txt_data; // pass in your data struct when creating

options_exists = struct_exists(txt, "options"); 
current_page = 0;
text_pause_timer = 0;
draw_char = 0;
text_speed = 1;

current_page = 0; // index for pages array
draw_char = 0;
text_speed = 1;
// Position
textbox_buffer = 50;
x = (display_get_gui_width() - 816) / 2;
y = display_get_gui_height() - 209 - textbox_buffer;

width = 816;
height = 209;

portrait_width  = 210;
portrait_height = 197;
text_padding = 20;

txtb_spr = spr_dialogue_box;
sndBlep = sndTextBlip; 

current_node = "start"; // start dialogue
draw_char = 0;
text_speed = 1;

option_hover = 0; // track which option is hovered
option_select_cooldown = 0; // prevent rapid input
