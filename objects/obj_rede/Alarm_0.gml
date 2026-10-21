if (timeout_encerramento)
{
    audio_stop_sound(snd_musica);
    rede_encerrar();
    room_goto(rm_menu);
}