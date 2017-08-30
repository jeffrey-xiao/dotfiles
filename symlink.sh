#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

shopt -s nullglob
shopt -s dotglob

## Link to ~
for folder in git vim system compton tmux rtorrent; do
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~
  done
done

## Link to ~/.$folder
for folder in ncmpcpp weechat templates bin; do
  # rm -rf ~/.$folder
  mkdir -pv ~/.$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.$folder
  done
done

## Link to .config/$folder
for folder in mpd i3 ranger mpv fontconfig htop dunst polybar zathura; do
  # rm -rf ~/.config/$folder
  mkdir -pv ~/.config/$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.config/$folder
  done
done

## Link other options
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
ln -sfv "$DOTFILES_DIR/fonts/fonts.conf" ~/.config/fontconf
for f in $DOTFILES_DIR/fonts/*.ttf; do
  ln -sfv "$f" ~/.fonts
done

## Create a playlist folder and database file for mpd
mkdir -pv ~/.config/mpd/playlists
touch ~/.config/mpd/database


## Create complete, incomplete, and session folders for rtorrent
mkdir -pv ~/.tmp ~/.bin ~/Downloads/complete ~/Downloads/incomplete ~/.rtorrent.sessions

## Create screenshot folder for mpv
mkdir -pv ~/Pictures/screenshots

xrdb ~/.Xresources

## Install zathura from source
mkdir -pv ~/Documents/source
git clone https://github.com/pwmt/zathura ~/Documents/source/zathura
git clone https://github.com/pwmt/zathura-pdf-poppler ~/Documents/source/zathura-pdf-poppler
cd ~/Documents/source/zathura && sudo make install
cd ~/Documents/source/zathura-pdf-poppler && sudo make install
