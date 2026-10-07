draw_self();

//Funcoes que alinham o texto, OBS: aplicam para todo texto do jogo
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, texto);

//Reiniciando os valores para nao aplicar em tudo
draw_set_halign(-1);
draw_set_valign(-1);
