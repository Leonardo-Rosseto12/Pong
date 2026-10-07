draw_self();

if(global.dois_jogadores)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(x, y, "2 Jogadores");

	//Reiniciando os valores para nao aplicar em tudo
	draw_set_halign(-1);
	draw_set_valign(-1);
}

else
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(x, y, "1 Jogador");

	//Reiniciando os valores para nao aplicar em tudo
	draw_set_halign(-1);
	draw_set_valign(-1);
}