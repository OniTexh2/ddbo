draw_sprite(spr_trinket, -1, 32, player_y)

if (state == "thanks") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(room_width * 0.5, room_height * 0.5, "Thanks for playing");
}
