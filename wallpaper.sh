#!/bin/bash
n=0

for i in /home/gustavo/Pictures/Wallpapers/*.mp4
do
  n=$((n+1))
done
array=($(ls /home/gustavo/Pictures/Wallpapers/*.mp4))
while :
do
  x=$((RANDOM%n))
  t=ffmpeg -i ${array[$x]} 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,// | cut -d ':' -f 3 | cut -d '.' -f 1 &
  echo $t
  kill $(pidof mplayer)
  if [ "$t" -lt 20 ]
  then
    #mplayer -loop 0 -rootwin -ao null -noconsolecontrols -fs ${array[$x]} &
    sleep 20
  else 
    #mplayer -rootwin -ao null -noconsolecontrols -fs ${array[$x]} &
    sleep 20
  fi
done
kill $(pidof mplayer)
