 if (distance_to_object(oPlayer) <= interactiondistance && !interactedwith) {
        instance_create_layer(x + 20, y+ -55, "Instances", E)
		interactedwith = true;
		
    }
	if (interactedwith && distance_to_object(oPlayer) > interactiondistance) {
    instance_destroy(E);
    interactedwith = false; 
}
if(interactedwith && keyboard_check_pressed(ord("E")) && !oPlayer.hasweapon){
	if(distance_to_object(oPlayer) <= interactedwith){
			instance_create_layer(oPlayer.x,oPlayer.y,"Instances", oGun)
			instance_destroy(obj_weaponpickup);
			oPlayer.hasweapon = true;
			oPlayer.currentweapon = "pistol";
			instance_destroy(E);
			interactedwith = false;
	}
}
