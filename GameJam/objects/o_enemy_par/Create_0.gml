/// @description Insert description here
event_inherited();
hp_max = 15;
hp = hp_max;

alert = false;
alert_dis = 160;
//distance the enemy stops from the player
attack_dis = 12;

attack_frame = 6;
can_attack = true;
attack_cooldown = 75;
damage = 2;
knockback_time = 10;

//path resource
path = path_add();

//speed that the player is chased at
move_spd = 1;

//delay for enemy calculating the path
calc_path_delay = 30;
//timer when path is calculated
calc_path_timer = irandom(60);


