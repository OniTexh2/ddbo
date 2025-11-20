/// Credits list
credits = [
    "Art & Animation:",
    "Tomkage",
    "Offi99",
    "Pa1n",
    "Luckycat",
    "Ewbot",
    "Guliy",
    "Nakavelli",
    "ClownManGuy",
    "Newsmen",
    "Glascade",
    "",

    "Voices:",
    "Katarina C",
    "",

    "Music:",
    "ReverieNova",
    "Augstin Etchebarne",
    "Jboy",
    "1Jayze",
    "SaiD",
    "Goose Loop",
    "Churgney ''Sturm'' Gurgney",
    "RioXT",
    "Senrinen",
    "Voyager",
    "NIX",
    "Bright Maddox",
    "Saruky",
    "Ryyn",
    "Pablou",
    "",

    "Coding:",
    "Oni_Texh",
    "Maki",
    "MrLevRocks",
    "BlueAxolotl",
    "",

    "Dialogue:",
    "Tomkage",
    "Y2KMarc",
    "",

    "Special Thanks:",
    "M1mka",
    "Evanski",
    "STANN.co for lending up",
	"his framework and art assets",
    "You, the player, for putting up",
	"with the bullshit that is this game."
];

credit_spacing = 16;     // Distance between each credit
spawn_y_start = room_height + 32;
scroll_speed = 0.5;

/// Spawn credit text objects
credit_ids = [];
var yy = spawn_y_start;

for (var i = 0; i < array_length(credits); i++) {
    var inst = instance_create_layer(room_width * 0.5, yy, "Instances", obj_credit_text);
    inst.text = credits[i];
    inst.halign = fa_center;
    inst.valign = fa_middle;

    array_push(credit_ids, inst);

    yy += credit_spacing;
}

/// Track state
state = "scrolling";
thanks_timer = 0;
thanks_duration = room_speed * 2;   // 2 seconds

player_y = 0

audio_stop_all()
audio_play_sound(mus_credits, 0, 1)
