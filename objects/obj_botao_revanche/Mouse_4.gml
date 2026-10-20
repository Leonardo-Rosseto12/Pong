audio_play_sound(snd_botao, 1, false);

if (obj_rede.modo_jogo == "offline")
{
    global.ponto_jogador1 = 0;
    global.ponto_jogador2 = 0;

    obj_rede.partida_encerrada = false;

    room_goto(rm_partida);
}