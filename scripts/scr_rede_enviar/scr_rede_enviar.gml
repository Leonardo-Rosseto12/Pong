function rede_enviar(socket, mensagem){
	var buffer = buffer_create(
		string_byte_length(mensagem) + 1,
		buffer_fixed,
		1
	);
	
	buffer_write(buffer, buffer_string, mensagem);
	
	network_send_packet(
		socket,
		buffer,
		buffer_tell(buffer)
	);
	
	buffer_delete(buffer);
}