#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

log_file=$DOTFILES_DIR/install.log
echo -n "" > $log_file

## Installing necessary applications
for f in \
  redshift \
  sublime-text vim-gnome \
  mpd mpc ncmpcpp \
  mpv \
  weechat \
  nautilus ranger \
  htop \
  tmux \
  scrot imagemagick compton i3lock \
  build-essential cmake python-dev python3-dev curl \
  fonts-font-awesome
do
  echo $f
  sudo apt-get install -y $f
  if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
    echo "$f successfully installed." >> $log_file
  else
    echo "$f failed to install." >> $log_file
  fi
done

## Reinstalling all vim packages via Plug and building YouCompleteMe
#rm -rf ~/.vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#vim -c PlugInstall -c q! -c q!
#~/.vim/plugged/youcompleteme/install.py --clang-completer

## Installing powerline fonts
#git clone https://github.com/powerline/fonts ~/fonts
#. ~/fonts/install.sh
