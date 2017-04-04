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
ln -sfv "$DOTFILES_DIR/system/.bash_powerline.sh" ~
ln -sfv "$DOTFILES_DIR/system/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/system/.bashrc" ~
ln -sfv "$DOTFILES_DIR/system/.dircolors" ~
ln -sfv "$DOTFILES_DIR/system/.profile" ~
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~
ln -sfv "$DOTFILES_DIR/system/.Xresources" ~

## Linking mpd and creating a playlist folder
mkdir -p ~/.config/mpd/playlists
ln -sfv "$DOTFILES_DIR/mpd/mpd.conf" ~/.config/mpd

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
ln -sfv "$DOTFILES_DIR/ranger/commands.py" ~/.config/ranger
ln -sfv "$DOTFILES_DIR/ranger/commands_full.py" ~/.config/ranger
ln -sfv "$DOTFILES_DIR/ranger/rc.conf" ~/.config/ranger
ln -sfv "$DOTFILES_DIR/ranger/rifle.conf" ~/.config/ranger
ln -sfv "$DOTFILES_DIR/ranger/scope.sh" ~/.config/ranger

## Linking mpv options
mkdir -p ~/.config/mpv
rm -rf ~/.config/mpv/lua-settings
ln -sfnv "$DOTFILES_DIR/mpv/lua-settings" ~/.config/mpv
ln -sfv "$DOTFILES_DIR/mpv/mpv.conf" ~/.config/mpv

## Linking other options
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
ln -sfv "$DOTFILES_DIR/other/.ycm_extra_conf.py" ~
