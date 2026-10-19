function rede_encerrar()
{
    if (obj_rede.socket >= 0)
    {
        network_destroy(obj_rede.socket);
        obj_rede.socket = -1;
    }

    if (obj_rede.servidor >= 0)
    {
        network_destroy(obj_rede.servidor);
        obj_rede.servidor = -1;
    }

    obj_rede.cliente_conectado = false;
    obj_rede.host_id = -1;
    obj_rede.cliente_id = -1;
    obj_rede.partida_encerrada = true;
    obj_rede.modo_jogo = "offline";
    obj_rede.sou_host = false;
}