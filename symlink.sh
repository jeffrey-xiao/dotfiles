#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

shopt -s nullglob
shopt -s dotglob


## Link to ~
for folder in compton git rtorrent system tmux; do
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~
  done
done


## Link to ~/.$folder
for folder in bin ncmpcpp templates weechat; do
  # rm -rf ~/.$folder
  mkdir -pv ~/.$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.$folder
  done
done


## Link to .config/$folder
for folder in dunst fontconfig htop i3 mpd mpv polybar ranger zathura; do
  # rm -rf ~/.config/$folder
  mkdir -pv ~/.config/$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.config/$folder
  done
done


## Link vim options
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/vim/.tern-config" ~
ln -sfv "$DOTFILES_DIR/vim/.clang_complete" ~

ln -sfv "$DOTFILES_DIR/vim/after" ~/.vim
ln -sfv "$DOTFILES_DIR/vim/minisnip" ~/.vim

mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp ~/.tags


## Link other options
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
ln -sfv "$DOTFILES_DIR/fonts/fonts.conf" ~/.config/fontconf

mkdir ~/.config/networkmanager-dmenu
ln -sfv "$DOTFILES_DIR/i3/config.ini" ~/.config/networkmanager-dmenu

mkdir -pv ~/.fonts
for f in $DOTFILES_DIR/fonts/*.ttf; do
  \cp -v "$f" ~/.fonts
done


## Create a playlist folder and database file for mpd
mkdir -pv ~/.config/mpd/playlists
touch ~/.config/mpd/database


## Create complete, incomplete, and session folders for rtorrent
mkdir -pv ~/.tmp ~/.bin ~/Downloads/complete ~/Downloads/incomplete ~/.rtorrent.sessions


## Create screenshot folder for mpv
mkdir -pv ~/Pictures/screenshots


## Apply ~/.xresources
xrdb ~/.Xresources
