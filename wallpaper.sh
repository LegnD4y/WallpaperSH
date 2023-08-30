#!/bin/bash
kill $(pidof mplayer)
n=0
for i in /home/gustavo/Imagens/Wallpapers/*.mp4
do
  n=$((n+1))
done
array=($(ls /home/gustavo/Imagens/Wallpapers/*.mp4))
while :
do
  x=$((RANDOM%n))
  t=$($(ffmpeg -i ${array[$x]} 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,// | cut -d ':' -f 3 | cut -d '.' -f 1) * 60)
  t=$($t+$(ffmpeg -i ${array[$x]} 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,// | cut -d ':' -f 3 | cut -d '.' -f 1))
  if [ "$t" -lt 30 ]
  then
    mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fs ${array[$x]} &
    sleep 30
    kill $(pidof mplayer)
  else
    if [ "$t" -gt 60 ]
    then
      mplayer -rootwin -ao null -noconsolecontrols -fs ${array[$x]} &
      sleep 60
      kill $(pidof mplayer)
    else
      mplayer -rootwin -ao null -noconsolecontrols -fs ${array[$x]} && kill $(pidof mplayer)
    fi
  fi
done
kill $(pidof mplayer)
