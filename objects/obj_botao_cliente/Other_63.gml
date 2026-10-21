if (async_load[? "id"] == obj_rede.id_ip)
{
    var _ip = async_load[? "result"];

    if (_ip != "")
    {
        rede_conectar(_ip);
        room_goto(rm_espera);
    }
}