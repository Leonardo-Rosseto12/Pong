if (obj_rede.modo_jogo == "offline")
{
	audio_play_sound(snd_botao, 1, false, 0.5);
    room_goto(rm_partida);
}