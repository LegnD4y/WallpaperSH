#!/bin/bash
kill $(pidof mplayer)
while :
do
  for i in $(ls /home/gustavo/Imagens/Wallpapers/*.mp4 | shuf);
  do
    mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fstype layer $i &
    sleep 30
    kill $(pidof mplayer)
  done
done
kill $(pidof mplayer)
