if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
	if(mouse_check_button_pressed(mb_left)){
		flag = true;
		audio_play_sound(shotgun_03_38220, 0, false);
	 }
}
	

if(flag)
{

	var duration = 2;
		sprite_index = spr_startshot;
		timer += delta_time / 1000000;
		if (timer >= duration) {
		 room_goto_next();
		}
}
