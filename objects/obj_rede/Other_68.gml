var _tipo = async_load[? "type"];

if (_tipo == 2)
{
    show_debug_message("CONEXAO ENCERRADA");

    if (obj_rede.modo_jogo == "host")
    {
        show_debug_message("CLIENTE DESCONECTADO");

        obj_rede.timeout_encerramento = false;
        obj_rede.alarm[0] = -1;

        audio_stop_sound(snd_musica);
        rede_encerrar();
		
        obj_rede.aviso_desconexao = true;
        obj_rede.alarm[1] = 180;
    }
}

if (_tipo == 3)
{
    var _buffer = async_load[? "buffer"];

    var _mensagem = buffer_read(
        _buffer,
        buffer_string
    );
	
	if (string_copy(_mensagem, 1, 11) == "RAQUETE2_Y:")
	{
	    if (obj_rede.modo_jogo == "host")
	    {
	        var _posicao_y = real(
	            string_delete(_mensagem, 1, 11)
	        );

	        if (instance_exists(obj_raquete2))
	        {
	            obj_raquete2.y = _posicao_y;
	        }
	    }
	}

	if (_mensagem == "OLA_HOST")
	{
	    cliente_id = async_load[? "id"];

	    rede_enviar(
	        cliente_id,
	        "OLA_CLIENTE"
	    );

	    show_debug_message("HOST CONFIRMADO");
	    show_debug_message("ID DO CLIENTE: " + string(cliente_id));
	}

	if (_mensagem == "OLA_CLIENTE")
	{
	    cliente_id = async_load[? "id"];

	    cliente_conectado = true;

	    show_debug_message("CLIENTE CONFIRMOU CONEXAO");
	    show_debug_message("ID DO CLIENTE: " + string(cliente_id));

	    rede_enviar(
	        cliente_id,
	        "INICIAR_PARTIDA"
	    );
	    room_goto(rm_partida);
	}
	
	if (_mensagem == "INICIAR_PARTIDA")
	{
	    show_debug_message("INICIANDO PARTIDA NO CLIENTE");

	    room_goto(rm_partida);
	}
	
	if (_mensagem == "FIM_PARTIDA" && !partida_encerrada)
	{
		show_debug_message("CLIENTE RECEBEU FIM_PARTIDA");
	    partida_encerrada = true;

	    rede_enviar(
	        obj_rede.socket,
	        "FIM_CONFIRMADO"
	    );

	    global.ponto_jogador1 = 0;
	    global.ponto_jogador2 = 0;

	    audio_stop_sound(snd_musica);
	    room_goto(rm_menu);
	}
	
	if (_mensagem == "FIM_CONFIRMADO" && obj_rede.modo_jogo == "host")
	{
	    show_debug_message("HOST RECEBEU FIM_CONFIRMADO");
		
		 obj_rede.timeout_encerramento = false;
		 obj_rede.alarm[0] = -1;

	    audio_stop_sound(snd_musica);

	    global.ponto_jogador1 = 0;
	    global.ponto_jogador2 = 0;

	    rede_encerrar();
	    room_goto(rm_menu);
	}
}