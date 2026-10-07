audio_play_sound(snd_bola, 1, false);

randomise();

switch (irandom(3)){
	case 0:
		direction = random_range(20, 70);
		break;
	case 1:
		direction = random_range(110, 160);
		break;
	case 2:
		direction = random_range(200, 250);
		break;	
	case 3:
		direction = random_range(290, 340);
		break;
}

speed = vel;