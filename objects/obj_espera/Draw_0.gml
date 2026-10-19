draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    room_width / 2,
    room_height / 2 - 30,
    "PONG LAN"
);

if (obj_rede.modo_jogo == "host")
{
    draw_text(
        room_width / 2,
        room_height / 2 + 10,
        "Aguardando outro jogador..."
    );
}
else if (obj_rede.modo_jogo == "cliente")
{
    draw_text(
        room_width / 2,
        room_height / 2 + 10,
        "Conectando ao servidor..."
    );
}

draw_set_halign(-1);
draw_set_valign(-1);