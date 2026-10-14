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