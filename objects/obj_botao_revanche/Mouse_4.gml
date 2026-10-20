audio_play_sound(snd_botao, 1, false);

if (obj_rede.modo_jogo == "offline")
{
    global.ponto_jogador1 = 0;
    global.ponto_jogador2 = 0;

    obj_rede.partida_encerrada = false;

    room_goto(rm_partida);
}

else if (obj_rede.modo_jogo == "host" && !obj_rede.revanche_host)
{
    obj_rede.revanche_host = true;

    obj_rede.mensagem_revanche = "Aguardando outro jogador...";
    obj_rede.alarm[2] = obj_rede.duracao_mensagem;

    if (obj_rede.cliente_id >= 0)
        rede_enviar(obj_rede.cliente_id, "REVANCHE_HOST");
}

else if (obj_rede.modo_jogo == "cliente" && !obj_rede.revanche_cliente)
{
    obj_rede.revanche_cliente = true;

    obj_rede.mensagem_revanche = "Aguardando outro jogador...";
    obj_rede.alarm[2] = obj_rede.duracao_mensagem;

    if (obj_rede.host_id >= 0)
        rede_enviar(obj_rede.host_id, "REVANCHE_CLIENTE");
}