if (obj_rede.modo_jogo == "host" && obj_rede.cliente_id >= 0)
{
    rede_enviar(obj_rede.cliente_id, "SOM_BOLA");
}

move_bounce_solid(true);

speed += acc;

audio_pause_sound(snd_bola);

audio_play_sound(snd_bola, 1, false, 0.5);