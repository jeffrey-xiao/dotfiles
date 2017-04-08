#!/usr/bin/env bash

## Get current directory
export DOTFILES_DIR
DOTFILES_DIR=$(pwd)

## Linking git options
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

## Linking vim options
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

## Linking system options
for f in $(ls -A $DOTFILES_DIR/system); do
  ln -sfv "$DOTFILES_DIR/system/$f" ~
done
xrdb ~/.Xresources

## Linking mpd and creating a playlist folder
mkdir -p ~/.config/mpd/playlists
ln -sfv "$DOTFILES_DIR/mpd/mpd.conf" ~/.config/mpd
touch ~/.config/mpd/database
touch ~/.config/mpd/socket

## Linking ncmpcpp options
mkdir -p ~/.ncmpcpp
ln -sfv "$DOTFILES_DIR/ncmpcpp/config" ~/.ncmpcpp

## Linking tmux options
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~

## Linking sublime text package options
mkdir -p ~/.config/sublime-text-3/Packages
rm -rf ~/.config/sublime-text-3/Packages/User
ln -sfnv "$DOTFILES_DIR/sublime/User" ~/.config/sublime-text-3/Packages

## Linking compton options
ln -sfv "$DOTFILES_DIR/compton/.compton.conf" ~

## Linking i3 options
rm -rf ~/.config/i3
ln -sfnv "$DOTFILES_DIR/i3" ~/.config

## Linking weechat options
rm -rf ~/.weechat
ln -sfvT "$DOTFILES_DIR/weechat" ~/.weechat

## Linking ranger options
mkdir -p ~/.config/ranger
for f in $(ls -A $DOTFILES_DIR/ranger); do
  ln -sfv "$DOTFILES_DIR/ranger/$f" ~/.config/ranger
done

## Linking mpv options
mkdir -p ~/.config/mpv
rm -rf ~/.config/mpv/lua-settings
ln -sfnv "$DOTFILES_DIR/mpv/lua-settings" ~/.config/mpv
ln -sfv "$DOTFILES_DIR/mpv/mpv.conf" ~/.config/mpv

## Linking other options
mkdir -p ~/.config/htop
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
ln -sfv "$DOTFILES_DIR/other/.ycm_extra_conf.py" ~
ln -sfv "$DOTFILES_DIR/other/htoprc" ~/.config/htop
