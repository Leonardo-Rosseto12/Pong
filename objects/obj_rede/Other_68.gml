var _tipo = async_load[? "type"];

if (_tipo == 2 && modo_jogo == "host")
{
    timeout_encerramento = false;
    alarm[0] = -1;

    audio_stop_sound(snd_musica);

    pontos_enviados_jogador1 = -1;
    pontos_enviados_jogador2 = -1;

    rede_encerrar();

    aviso_desconexao = true;
    alarm[1] = 180;
	global.ponto_jogador1 = 0;
    global.ponto_jogador2 = 0;
}

if (_tipo == 3)
{
    var _buffer = async_load[? "buffer"];
    var _mensagem = buffer_read(_buffer, buffer_string);

    if (string_copy(_mensagem, 1, 7) == "PONTOS:" && modo_jogo == "cliente")
    {
        var _dados = string_delete(_mensagem, 1, 7);
        var _separador = string_pos(":", _dados);

        if (_separador > 0)
        {
            global.ponto_jogador1 = real(string_copy(_dados, 1, _separador - 1));
            global.ponto_jogador2 = real(string_delete(_dados, 1, _separador));
        }
    }

    if (string_copy(_mensagem, 1, 5) == "BOLA:" && modo_jogo == "cliente")
    {
        var _dados = string_delete(_mensagem, 1, 5);
        var _separador = string_pos(":", _dados);

        if (_separador > 0)
        {
            var _posicao_x = real(string_copy(_dados, 1, _separador - 1));
            var _posicao_y = real(string_delete(_dados, 1, _separador));

            if (instance_exists(obj_bola))
            {
                obj_bola.x = _posicao_x;
                obj_bola.y = _posicao_y;
            }
        }
    }

    if (string_copy(_mensagem, 1, 10) == "RAQUETE_Y:" && modo_jogo == "cliente")
    {
        var _posicao_y = real(string_delete(_mensagem, 1, 10));

        if (instance_exists(obj_raquete)) obj_raquete.y = _posicao_y;
    }

    if (string_copy(_mensagem, 1, 11) == "RAQUETE2_Y:" && modo_jogo == "host")
    {
        var _posicao_y = real(string_delete(_mensagem, 1, 11));

        if (instance_exists(obj_raquete2)) obj_raquete2.y = _posicao_y;
    }

    if (_mensagem == "REINICIAR_RAQUETES" && modo_jogo == "cliente")
    {
        if (instance_exists(obj_raquete2)) obj_raquete2.y = 116;
    }

    if (_mensagem == "OLA_HOST")
    {
        cliente_id = async_load[? "id"];
        rede_enviar(cliente_id, "OLA_CLIENTE");
    }

	if (_mensagem == "OLA_CLIENTE")
	{
	    host_id = async_load[? "id"];
	    cliente_conectado = true;

	    rede_enviar(host_id, "INICIAR_PARTIDA");
	    room_goto(rm_partida);
	}

    if (_mensagem == "INICIAR_PARTIDA") room_goto(rm_partida);

    if (_mensagem == "FIM_PARTIDA" && !partida_encerrada)
    {
        partida_encerrada = true;

        rede_enviar(socket, "FIM_CONFIRMADO");

        audio_stop_sound(snd_musica);
        room_goto(rm_game_over);
    }

    if (_mensagem == "FIM_CONFIRMADO" && modo_jogo == "host")
    {
        timeout_encerramento = false;
        alarm[0] = -1;

        audio_stop_sound(snd_musica);
        room_goto(rm_game_over);
    }

    if (_mensagem == "REVANCHE_CLIENTE" && modo_jogo == "host")
	{
	    revanche_cliente = true;

	    if (!revanche_host)
	    {
	        mensagem_revanche = "Pedido de revanche!!!";
	        alarm[2] = duracao_mensagem;
	    }
	}

	if (_mensagem == "REVANCHE_HOST" && modo_jogo == "cliente")
	{
	    revanche_host = true;

	    if (!revanche_cliente)
	    {
	        mensagem_revanche = "Pedido de revanche!!!";
	        alarm[2] = duracao_mensagem;
	    }
	}

    if (_mensagem == "INICIAR_REVANCHE" && modo_jogo == "cliente")
    {
        global.ponto_jogador1 = 0;
        global.ponto_jogador2 = 0;

        revanche_host = false;
        revanche_cliente = false;
        partida_encerrada = false;

        room_goto(rm_partida);
    }
	
	if (_mensagem == "SOM_BOLA" && modo_jogo == "cliente")
	{
		audio_pause_sound(snd_bola);
		audio_play_sound(snd_bola, 1, false, 0.5);
	}

	if (_mensagem == "SOM_PONTO" && modo_jogo == "cliente") audio_play_sound(snd_ponto, 1, false, 2);
}
