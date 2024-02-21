/// @description
switch(state) {
	default:
		reset_variables();

		get_input();

		calc_movement();
		
		aim_bow();
		
		check_fire();

		anim();
	break;
	case states.KNOCKBACK:
		reset_variables();
		
		aim_bow();
		
		calc_movement();
		
		if knockback_time-- <= 0 state = states.IDLE;

		anim();
	break;
	case states.DEAD:
		reset_variables();

		calc_movement();
		
		if ready_to_start and mouse_check_button_pressed(mb_left) game_restart();

		anim();
	break;
}