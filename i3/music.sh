#include #!/bin/bash

filter () {
  tr '\n' ' ' | grep -Po '.*(?=\[(playing|paused)\])' | xargs | tr -d '\n'
}

case $BLOCK_BUTTON in
  3) mpc toggle | filter ;; # Right Click: Play/Pause
  4) mpc next   | filter ;; # Scroll Up: Next
  5) mpc prev   | filter ;; # Scroll Down: Prev
  *) mpc status | filter ;;
esac
