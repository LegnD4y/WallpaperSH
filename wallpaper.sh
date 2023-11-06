#!/bin/bash
kill $(pidof mplayer)
n=($(ls /home/gustavo/Imagens/Wallpapers/*.mp4 | wc -l))
array=($(ls /home/gustavo/Imagens/Wallpapers/*.mp4))
while :
do
  x=$((RANDOM%n))
  mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fs ${array[$x]} &
  sleep 30
  kill $(pidof mplayer)
done
kill $(pidof mplayer)
