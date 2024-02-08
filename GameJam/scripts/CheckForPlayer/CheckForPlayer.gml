function check_for_player(){
	//@desc if player is close enough zombie start chasing

	var _dis = distance_to_object(oPlayer);
	
	//can we start chasing?
	if ((_dis <= alert_dis) or alert) and _dis > attack_dis {
		
	alert = true;
	
	
	if calc_path_timer-- <= 0 {
		
	calc_path_timer = calc_path_delay;
	
	var _found_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, choose(0, 1));
	
		if _found_player{
			path_start(path, move_spd, path_action_stop, false);
				}
			}
		} else {
			//are we close enought to attack
			if _dis <= attack_dis {
				path_end();
		}
	}
}	