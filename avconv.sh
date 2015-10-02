#!/bin/bash
# convert m4a and flac to mp3 with the avconv program
# this probably has dependencies that need to be setup first

for f in *.m4a; do
  avconv -i "$f" -aq 2 "${f%.m4a}.mp3"
done

for f in *.flac; 
do (
  avconv -i "$f" -aq 2 "${f%.flac}.mp3"
) &
done
