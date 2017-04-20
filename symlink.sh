#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

## Linking to ~
for folder in git vim system compton tmux; do
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~
  done
done

## Linking to ~/$folder
for folder in ncmpcpp weechat; do
  # rm -rf ~/.$folder
  mkdir -p ~/.$folder
  for f in $DOTFILES_DIR/$folder/*; do
    echo $f
    ln -sfv "$f" ~/.$folder
  done
done

## Linking to .config/$folder
for folder in mpd sublime-text-3/Packages/User i3 ranger mpv qpdfview fontconfig htop; do
  # rm -rf ~/.config/$folder
  mkdir -p ~/.config/$folder
  for f in $DOTFILES_DIR/$folder/*; do
    ln -sfv "$f" ~/.config/$folder
  done
done

## Creating a playlist folder for mpd and database file
mkdir -p ~/.config/mpd/playlists
touch ~/.config/mpd/database

xrdb ~/.Xresources

## Linking other options
mkdir ~/tmp
mkdir ~/bin
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
ln -sfv "$DOTFILES_DIR/other/umpv" ~/bin
