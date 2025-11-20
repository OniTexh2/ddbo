global.desktop_background = 0;

// Icon values
icon_size = 48;
icon_count = sprite_get_number(spr_desktop_icons) - 1; // because frame 0 = highlight
hover_index = -1;

// Gallery data
gallery_photos = [
    velvet_nishiki_gallery,
    coco_gallery,
    discoria_gallery,
    trinket_gallery,
    vincent_whirr_gallery
];

interaction_disabled = false; // for icon 3 behavior
sound_playing = -1;

window_set_cursor(cr_none)