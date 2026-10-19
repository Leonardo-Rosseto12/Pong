if (timeout_encerramento)
{
    show_debug_message("TEMPO LIMITE DE ENCERRAMENTO ATINGIDO");
    audio_stop_sound(snd_musica);
    rede_encerrar();
    room_goto(rm_menu);
}