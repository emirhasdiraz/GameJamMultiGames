 if (distance_to_object(oPlayer) <= interactiondistance && !interactedwith) {
        instance_create_layer(x + -10, y+ -70, "Instances", E)
		interactedwith = true;
		
    }
	if (interactedwith && distance_to_object(oPlayer) > interactiondistance) {
    instance_destroy(E);
    interactedwith = false; 
}
if(interactedwith && keyboard_check_pressed(ord("E")) && !oPlayer.hasweapon){
	if(distance_to_object(oPlayer) <= interactedwith){
			instance_create_layer(oPlayer.x,oPlayer.y,"Instances", obj_shotgun)
			instance_destroy(obj_shottiepickup);
			oPlayer.hasweapon = true;
			oPlayer.currentweapon = "shotgun";
			instance_destroy(E);
			interactedwith = false;
	}
}
