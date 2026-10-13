audio_play_sound(snd_botao, 1, false);

obj_rede.sou_host = false;
obj_rede.modo_jogo = "cliente";

obj_rede.id_ip = get_string_async("Digite o IP do Host:", "");