audio_play_sound(snd_ponto, 1, false, 2);

x = xstart;
y = ystart;

speed = 0;

obj_raquete2.y = 116;
obj_raquete.y = 116;

if (obj_rede.modo_jogo == "host" && obj_rede.cliente_id >= 0)
{
    rede_enviar(
        obj_rede.cliente_id,
        "REINICIAR_RAQUETES"
    );
}

alarm[0] = 60;