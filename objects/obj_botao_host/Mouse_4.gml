audio_play_sound(snd_botao, 1, false);

obj_rede.sou_host = true;
obj_rede.modo_jogo = "host";

rede_iniciar_host();

if (obj_rede.servidor >= 0)
{
    room_goto(rm_espera);
}