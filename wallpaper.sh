#!/bin/bash
kill $(pidof xwinwrap)
while :
do
  for i in $(ls $HOME/Videos/Wallpapers/*.mp4 | shuf);
  do
    MOVX=0
    I=0
    YInit=0
    
    for j in $(xrandr|awk '/*/{print $1}');
    do
      arrIN=(${j//x/ })

      if [ $I -eq 0 ]; 
      then
        YInit=${arrIN[1]}
      fi

      MOVY=$((YInit-arrIN[1]))
      xwinwrap -ov -g ${arrIN[0]}x${arrIN[1]}+$MOVX+$MOVY -- mpv -wid WID $i --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings &
      echo xwinwrap -ov -g ${arrIN[0]}x${arrIN[1]}+$MOVX+$MOVY -- mpv -wid WID $i --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings &
      MOVX=$((MOVX+arrIN[0]))
      I=$((I+1))
    done

    sleep 30
    echo antes do kill
    kill $(pidof xwinwrap)
    echo depois do kill
  done
done
kill $(pidof xwinwrap)
