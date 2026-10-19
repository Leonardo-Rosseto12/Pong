if (obj_rede.modo_jogo == "offline" || obj_rede.modo_jogo == "host")
{
    if (gol_player1)
    {
        global.ponto_jogador1++;
    }
    else
    {
        global.ponto_jogador2++;
    }
}