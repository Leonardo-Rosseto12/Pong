function rede_conectar(ip)
{
	obj_rede.sou_host = false;
	obj_rede.modo_jogo = "cliente";
	
	obj_rede.socket = network_create_socket(network_socket_tcp);
	
	network_connect(
		obj_rede.socket,
		ip,
		obj_rede.porta
	);
	
	rede_enviar(
		obj_rede.socket,
		"OLA_HOST"
	);
}
