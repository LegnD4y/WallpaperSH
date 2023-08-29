#!/bin/bash

:> lista.txt

for video in /home/gustavo/Pictures/Wallpapers/*.mp4
do
  echo -n "$video: "  >> lista.txt
  ffmpeg -i $video 2>&1 | grep "Duration"| cut -d ' ' -f 4 | sed s/,// >> lista.txt
done
