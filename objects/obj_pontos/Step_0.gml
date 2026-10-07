if(global.ponto_jogador1 >= global.pontos_max){
	global.ponto_jogador1 = 0;
	global.ponto_jogador2 = 0;
	game_restart();
}

if(global.ponto_jogador2 >= global.pontos_max){
	global.ponto_jogador1 = 0;
	global.ponto_jogador2 = 0;
	game_restart();
}

