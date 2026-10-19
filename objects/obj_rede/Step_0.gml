if (modo_jogo == "cliente" && socket >= 0)
{
    if (instance_exists(obj_raquete2))
    {
        var _mensagem = "RAQUETE2_Y:" + string(obj_raquete2.y);

        rede_enviar(
            socket,
            _mensagem
        );
    }
}

if (modo_jogo == "host" && cliente_id >= 0 && !partida_encerrada)
{
    if (instance_exists(obj_raquete))
    {
        var _mensagem = "RAQUETE_Y:" + string(obj_raquete.y);

        rede_enviar(
            cliente_id,
            _mensagem
        );
    }
}

if (modo_jogo == "host" && cliente_id >= 0 && !partida_encerrada)
{
    if (instance_exists(obj_bola))
    {
        var _mensagem = "BOLA:" + string(obj_bola.x) + ":" + string(obj_bola.y);

        rede_enviar(
            cliente_id,
            _mensagem
        );
    }
}


