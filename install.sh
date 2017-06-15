#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

log_file=$DOTFILES_DIR/install.log
echo -n "" > $log_file

## Installing necessary applications
# ppa for youtube-dl
sudo add-apt-repository ppa:nilarimogard/webupd8
# ppa for sublime-text-3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update

# Download eclipse, i3-gaps, and i3blocks-gaps from source
for f in \
  rxvt-unicode-256color \
  redshift \
  sublime-text-installer vim-gnome \
  mpd mpc ncmpcpp \
  mpv \
  weechat \
  nautilus ranger \
  htop \
  tmux \
  chromium-browser \
  scrot imagemagick compton i3lock rofi \
  build-essential cmake python-dev python3-dev curl \
  fonts-font-awesome x11-xserver-utils playerctl \
  youtube-dl qpdfview w3m acpi sysstat feh jq blueman \
  xautolock atool redshift-gtk xbacklight gnome-settings-daemon network-manager xclip \
  dunst
do
  sudo apt-get install -y $f
  if [ $(dpkg-query -W -f='${Status}' $f 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
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
git clone https://github.com/sunaku/tamzen-font ~/fonts/tamzen-font
mkdir ~/.fonts
cp ~/fonts/tamzen-font/bdf/TamzenForPowerline8x16* ~/.fonts
xrdb ~/.Xresources
