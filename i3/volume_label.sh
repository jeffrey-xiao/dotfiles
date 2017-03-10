#!/bin/sh
res="$(/usr/share/i3blocks/volume 5 pulse)"
vol=$(echo $res | cut -d'%' -f 1)

if [ $vol -le 10 ]; then
  echo ""
elif [ $vol -le 50 ]; then
  echo ""
else
  echo ""
fi
