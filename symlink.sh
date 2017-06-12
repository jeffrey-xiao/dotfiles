#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

shopt -s nullglob
shopt -s dotglob

## Linking to ~
for folder in git vim system compton tmux rtorrent; do
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~
  done
done

## Linking to ~/.$folder
for folder in ncmpcpp weechat templates bin; do
  # rm -rf ~/.$folder
  mkdir -p ~/.$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.$folder
  done
done

## Linking to .config/$folder
for folder in mpd sublime-text-3/Packages/User i3 ranger mpv qpdfview fontconfig htop dunst; do
  # rm -rf ~/.config/$folder
  mkdir -p ~/.config/$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.config/$folder
  done
done

## Creating a playlist folder for mpd and database file
mkdir -p ~/.config/mpd/playlists
touch ~/.config/mpd/database

## Linking other options
mkdir -p ~/.tmp ~/.bin ~/Downloads/complete ~/Downloads/incomplete ~/.rtorrent.sessions
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
xrdb ~/.Xresources
