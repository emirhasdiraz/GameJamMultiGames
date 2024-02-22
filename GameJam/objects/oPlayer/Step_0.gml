
if (hascontrol)
{
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check (vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check (vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
}

else
{
key_left = 0;
key_right = 0;
key_jump = 0;
key_up = 0;
key_down = 0;
}

// Calculate movement horizontally
var move_x = key_right - key_left;
hsp = move_x * walksp;

// Calculate movement vertically
var move_y = key_down - key_up;
vsp = move_y * walksp;

if(move != 0 || move2 != 0){
	if (move_x > 0) {
        sprite_index = spr_walk;
    } else if (move_x < 0) {
        sprite_index = spr_walkL;
	} else if (move_y < 0){
	sprite_index = spr_back;
	}
	else{
	sprite_index = spr_idle;
   }
}

if (place_meeting(x+hsp,y,Obj_muur))
{
	while (!place_meeting(x+sign(hsp),y,Obj_muur))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

if (place_meeting(x,y+vsp,Obj_muur))
{
	while (!place_meeting(x,y+sign(vsp),Obj_muur))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;


if(hasweapon &&  keyboard_check_pressed(ord("Q"))){
	if(currentweapon == "pistol"){
      instance_destroy(oGun);
	  instance_create_layer(x + 30, y, "Instances", obj_weaponpickup);
	  oPlayer.hasweapon = false;
	  audio_play_sound(place_something_42719, 0, false);
	}
	else if(currentweapon == "shotgun"){
		instance_destroy(obj_shotgun);
		instance_create_layer(x + 30, y, "Instances", obj_shottiepickup);
		oPlayer.hasweapon = false;
	}
	hasweapon = false;
}