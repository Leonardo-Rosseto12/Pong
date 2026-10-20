if (obj_rede.mensagem_revanche != "")
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        display_get_gui_width() / 2,
        display_get_gui_height() * 0.7,
        obj_rede.mensagem_revanche
    );

    draw_set_halign(-1);
    draw_set_valign(-1);
}