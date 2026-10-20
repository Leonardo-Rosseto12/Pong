if (obj_rede.modo_jogo == "host" && !obj_rede.partida_encerrada)
{
    if (obj_rede.cliente_id >= 0)
    {
        if (global.ponto_jogador1 != obj_rede.pontos_enviados_jogador1 || global.ponto_jogador2 != obj_rede.pontos_enviados_jogador2)
        {
            var _mensagem = "PONTOS:" + string(global.ponto_jogador1) + ":" + string(global.ponto_jogador2);

            rede_enviar(
                obj_rede.cliente_id,
                _mensagem
            );

            obj_rede.pontos_enviados_jogador1 = global.ponto_jogador1;
            obj_rede.pontos_enviados_jogador2 = global.ponto_jogador2;
        }
    }
}

if (!obj_rede.partida_encerrada)
{
    if (obj_rede.modo_jogo == "offline" || obj_rede.modo_jogo == "host")
    {
        if (global.ponto_jogador1 >= global.pontos_max || global.ponto_jogador2 >= global.pontos_max)
        {
            obj_rede.partida_encerrada = true;
			obj_rede.revanche_host = false;
			obj_rede.revanche_cliente = false;

            if (obj_rede.modo_jogo == "host" && obj_rede.cliente_id >= 0)
            {
                rede_enviar(obj_rede.cliente_id, "FIM_PARTIDA");

                obj_rede.timeout_encerramento = true;
                obj_rede.alarm[0] = 300;
            }
            else
            {
                audio_stop_sound(snd_musica);

                if (obj_rede.modo_jogo == "host") rede_encerrar();

                room_goto(rm_game_over);
            }
        }
    }
}