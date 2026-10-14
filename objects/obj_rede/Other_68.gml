var _tipo = async_load[? "type"];

show_debug_message("TIPO: " + string(_tipo));

if (_tipo == 3)
{
    var _buffer = async_load[? "buffer"];

    var _mensagem = buffer_read(
        _buffer,
        buffer_string
    );

    show_debug_message("MENSAGEM RECEBIDA: " + _mensagem);
	
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
	    host_id = async_load[? "id"];

	    rede_enviar(
	        host_id,
	        "OLA_CLIENTE"
	    );

	    show_debug_message("HOST CONFIRMADO");
	    show_debug_message("ID DO HOST: " + string(host_id));
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
}