#!/usr/bin/env bash

## Join array with delimiter
function join { local IFS="$1"; shift; echo "$*"; }

## Get current directory
DOTFILES_DIR=$(pwd)

log_file=$DOTFILES_DIR/install.log
echo -n "" > $log_file

declare -a programs=(
  compton
  dunst
  htop
  i3 scrot imagemagick i3lock rofi acpi sysstat feh jq blueman xbacklight gnome-settings-daemon network-manager xclip
  mpd mpc
  mpv
  ncmpcpp
  redshift youtube-dl
  polybar font-awesome-ttf
  ranger w3m feh
  rtorrent
  rxvt-unicode xrdb
  tmux
  vim cmake make curl g++
  weechat
  zathura
  xdotool
)
programs_string=$(join " " "${programs[@]}")
installed_program_list=$(eopkg li -i)

## Installing necessary applications (need to install component system.devel separately)
sudo eopkg it -y $programs_string

## Checking if applications are installed
for f in ${programs[@]}
do
  if [ $(echo $installed_program_list | grep -c "$f ") -eq 1 ]; then
    echo "$f successfully installed." >> $log_file
  else
    echo "$f failed to install." >> $log_file
  fi
done

## Reinstalling all vim packages via Plug and building YouCompleteMe
rm -rf ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall -c q! -c q!
~/.vim/plugged/youcompleteme/install.py --clang-completer

## Installing powerline fonts
git clone https://github.com/powerline/fonts ~/fonts/powerline-fonts
. ~/fonts/install.sh
xrdb ~/.Xresources
