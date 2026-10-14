if (obj_rede.modo_jogo == "offline")
{
    if (!global.dois_jogadores)
    {
        vspeed = global.velv_bola;

        if (vspeed >= vel_ia) vspeed = vel_ia;

        if (vspeed <= -vel_ia) vspeed = -vel_ia;
    }
}

else if (obj_rede.modo_jogo == "host") vspeed = 0;


else if (obj_rede.modo_jogo == "cliente")
{
    rede_enviar(
        obj_rede.host_id,
        "RAQUETE2_Y:" + string(y)
    );
}