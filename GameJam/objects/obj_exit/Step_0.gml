
if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
	if(mouse_check_button_released(mb_left)){
		flag = true;
		
	}
}
if(flag)
{
	var duration =2;
		sprite_index = spr_exitshot;
		timer += delta_time / 1000000;
		if (timer >= duration) {
		 game_end();
		}
}