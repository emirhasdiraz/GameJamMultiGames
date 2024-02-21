function calc_entity_movement() {
	x += hsp;
	y += vsp;
	
	hsp *= global.drag;
	vsp *= global.drag;
	
	check_if_stopped();
}

function calc_knockback_movement() {
	x += hsp;
	y += vsp;
	
	hsp *= 0.91;
	vsp *= 0.91;
	
	check_if_stopped();

	if knockback_time <= 0 state = states.IDLE;
}

function check_facing() {
	if knockback_time <= 0 {
	var _facing = sign(x - xp);
	if _facing != 0 facing  = _facing;
	}
}

function check_for_player() {
	
	if o_player.state ==  states.DEAD exit;
	
	var _dis = distance_to_object(o_player);
	
	//can we start chasing the player?
	if ((_dis <= alert_dis) or alert) and _dis > attack_dis {
		//enemy is alert
		alert = true;
	//can we calculate the path to the player
	if calc_path_timer-- <= 0 {
		//reset timer
		calc_path_timer = calc_path_delay;
	
		//path to player
		if x == xp and y == yp var _type = 0 else var _type = 1;
		var _found_player =	mp_grid_path(global.mp_grid, path, x, y, o_player.x, o_player.y, choose(0, 1));
	
		//start path
		if _found_player {
		path_start(path, move_spd, path_action_stop, false);	
		}
	  }
	} else {
		//is enemy close enough to attack?
		if _dis <= attack_dis {
			path_end();
			state = states.ATTACK;
		}
	}
}

function enemy_anim(){
	switch(state) {
	case states.IDLE:
		sprite_index = s_idle;
		show_hurt();
	break;
	case states.MOVE:
		sprite_index = s_walk;
		show_hurt();
	break;	
	case states.KNOCKBACK:
		show_hurt();
	break;
	case states.ATTACK:
		sprite_index = s_attack;
	break;
	case states.DEAD:
		sprite_index = s_dead;
	break;
	}
	
	depth = -bbox_bottom;
	//previous position update
	xp = x;
	yp = y;
}

function perform_attack() {
	if image_index >= attack_frame and can_attack {
		can_attack = false;
		alarm[0] = attack_cooldown;
		
		var _dir = point_direction(x, y, o_player.x, o_player.y);
		
		var _xx = x + lengthdir_x(attack_dis, _dir);
		var _yy = y + lengthdir_y(attack_dis, _dir);
		
		var _inst = instance_create_layer(_xx, _yy, "Instances", o_enemy_hitbox);
		_inst.owner_id = id;
		_inst.damage = damage;
		_inst.knockback_time = knockback_time;
	}
}

function show_hurt() {
	if knockback_time-- > 0 sprite_index = s_hurt;
}