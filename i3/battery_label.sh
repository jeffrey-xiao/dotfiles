#!/bin/sh
res="$(~/.config/i3/battery)"
bat=$(echo $res | cut -d'%' -f 1)
if [ $bat -le 10 ]; then
  echo " "
elif [ $bat -le 25 ]; then
  echo " "
elif [ $bat -le 50 ]; then
  echo " "
elif [ $bat -le 75 ]; then
  echo " "
else
  echo " "
fi
