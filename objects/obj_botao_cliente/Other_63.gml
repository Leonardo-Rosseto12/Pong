if (async_load[? "id"] == obj_rede.id_ip)
{
    show_debug_message("IP RECEBIDO");

    var _ip = async_load[? "result"];

    if (_ip != "")
    {
        rede_conectar(_ip);

        show_debug_message("INDO PARA ROOM DE ESPERA");

        room_goto(rm_espera);
    }
}