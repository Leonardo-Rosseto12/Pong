audio_play_sound(snd_botao, 1, false);

global.ponto_jogador1 = 0;
global.ponto_jogador2 = 0;

if (obj_rede.modo_jogo == "host" || obj_rede.modo_jogo == "cliente") rede_encerrar();

obj_rede.partida_encerrada = false;
obj_rede.timeout_encerramento = false;
obj_rede.aviso_desconexao = false;

room_goto(rm_menu);