#!/bin/bash

filter () {
  tr '\n' ' ' | output
}

output () {
  read status
  echo -n " $status" | grep -Po '.*(?=\[(playing|paused)\])' | xargs -0 | tr -d '\n'
  isPlaying=$(echo "$status" | grep -Pcim1 '.*(?=\[playing\])')
  isPaused=$(echo "$status" | grep -Pcim1 '.*(?=\[paused\])')
  if [ "$isPlaying" -eq 1 ]; then
    echo -n "  "
  elif [ "$isPaused" -eq 1 ]; then
    echo -n "  "
  else
    echo -n " No MPD Server "
  fi
}

case $BLOCK_BUTTON in
  3) mpc toggle | filter ;; # Right Click: Play/Pause
  4) mpc next   | filter ;; # Scroll Up: Next
  5) mpc prev   | filter ;; # Scroll Down: Prev
  *) mpc status | filter ;;
esac
