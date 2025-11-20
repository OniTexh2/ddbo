// STEP EVENT

var _txt = text;

// 1. Skip if empty
if (string_length(_txt) == 0 or color != c_white) exit;

// 2. Compute the text bounding box
var _w = string_width(_txt) / 2;
var _h = string_height(_txt) / 2;

var _left   = x - _w;
var _right  = x + _w;
var _top    = y - _h;
var _bottom = y + _h;

// 3. Skip if offscreen (using the visible room area / camera)
var _vx1 = camera_get_view_x(view_camera[0]);
var _vy1 = camera_get_view_y(view_camera[0]);
var _vx2 = _vx1 + camera_get_view_width(view_camera[0]);
var _vy2 = _vy1 + camera_get_view_height(view_camera[0]);

if (_right < _vx1 || _left > _vx2 || _bottom < _vy1 || _top > _vy2) exit;

// 4. Run a simple collision check
// (example: check for any instance of obj_fireball overlapping the text box)
if (collision_rectangle(_left, _top, _right, _bottom, obj_fireball, false, true))
{
    var _len = string_length(_txt);
    
    var total_w = string_width(_txt);
    var half_w  = total_w * 0.5;

    for (var i = 1; i <= _len; i++)
    {
        var ch = string_char_at(_txt, i);

        // width from beginning of string up to this character
        var w_before = string_width(string_copy(_txt, 1, i)) - string_width(ch);

        // actual X coordinate where the letter is drawn
        var cx = x - half_w + w_before + string_width(ch) * 0.5;

        // centered vertically (since you use middle align)
        var cy = y;

        var p = instance_create_layer(cx, cy, layer, obj_letter_piece);
        p.letter = ch;
    }

    instance_destroy();
    exit;
}

