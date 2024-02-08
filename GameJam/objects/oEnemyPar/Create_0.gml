/// @description are we chasing the player
alert = false;
/// can we start chasing the player
alert_dis = 160;
// distance where zombies start attacking 
attack_dis = 18;
// speed that player gets chased
move_spd = 1;
// create path resource
path = path_add();
// delay for calculating path
calc_path_delay = 30;
// timer when calculating path
calc_path_timer = irandom(60);



