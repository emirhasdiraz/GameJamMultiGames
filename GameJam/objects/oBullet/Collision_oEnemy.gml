if (place_meeting(x, y, oEnemy)) {
    // Reduce enemy's health
    with (instance_place(x, y, oEnemy)) {
		oEnemy.hp -= 10;
    }
    
    // Destroy the bullet
    instance_destroy();
}

instance_destroy();