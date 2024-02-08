//get player input

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

//calculate movement horizontally
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//calculate movement vertically
var move2 = key_down - key_up;

vsp = move2 * walksp

//horizontal collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;