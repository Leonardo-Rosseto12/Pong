if (!obj_rede.partida_encerrada)
{
    if (obj_rede.modo_jogo == "offline" || obj_rede.modo_jogo == "host")
    {
        if (global.ponto_jogador1 >= global.pontos_max || global.ponto_jogador2 >= global.pontos_max)
        {
            show_debug_message("PONTUACAO MAXIMA ATINGIDA");

            obj_rede.partida_encerrada = true;

			if (obj_rede.modo_jogo == "host")
			{
			    show_debug_message("ENVIANDO FIM_PARTIDA AO CLIENTE");

			    if (obj_rede.cliente_id >= 0)
			    {
			        rede_enviar(
			            obj_rede.cliente_id,
			            "FIM_PARTIDA"
			        );

			        obj_rede.timeout_encerramento = true;
			        obj_rede.alarm[0] = 300;
			    }
			    else
			    {
			        rede_encerrar();
			        room_goto(rm_menu);
			    }
			}
            else
            {
                global.ponto_jogador1 = 0;
                global.ponto_jogador2 = 0;

                game_restart();
            }
        }
    }
}
