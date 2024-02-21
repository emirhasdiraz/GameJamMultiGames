var firingRate = 10;
x = oPlayer.x + 30;
y = oPlayer.y + 5;
image_angle = point_direction(x, y, mouse_x, mouse_y);
firingdelay = max(0, firingdelay - firingRate);
recoil = max(0, recoil - 1);

if (mouse_check_button_released(mb_left) && (firingdelay <= 0)) {
    recoil = 4;
    firingdelay = 10;
    ScreenShake(2, 10);  
    var spread = 10;
    repeat(8) {
        var spreadAngle = image_angle + random_range(-spread, spread);
        var spreadX = lengthdir_x(recoil, spreadAngle);
        var spreadY = lengthdir_y(recoil, spreadAngle);
        
        with (instance_create_layer(x, y, "Bullets", oBullet)) {
            speed = 25;
            direction = spreadAngle;
            image_angle = direction;
            x += spreadX;
            y += spreadY;
        }
		audio_play_sound(shotgun_146188, 0, false);
    }
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);
