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

	    show_debug_message("CLIENTE CONFIRMOU CONEXAO");
	    show_debug_message("ID DO CLIENTE: " + string(cliente_id));
	}
}