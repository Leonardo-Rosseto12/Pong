function rede_iniciar_host()
{
	obj_rede.sou_host = true;
	obj_rede.modo_jogo = "host";
	
	obj_rede.servidor = network_create_server(
		network_socket_tcp,
		obj_rede.porta,
		1
	);
	
	if(obj_rede.servidor < 0)
	{
		obj_rede.sou_host = false;
		obj_rede.modo_jogo = "solo";
	}
}