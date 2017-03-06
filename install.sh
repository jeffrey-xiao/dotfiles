#!/usr/bin/env bash

# Get current directory
export DOTFILES_DIR

DOTFILES_DIR=$(pwd)

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

ln -sfv "$DOTFILES_DIR/system/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/system/.bashrc" ~
ln -sfv "$DOTFILES_DIR/system/.dircolors" ~
ln -sfv "$DOTFILES_DIR/system/.profile" ~
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~

mkdir -p ~/.config/mpd/playlists
ln -sfv "$DOTFILES_DIR/other/.mpdconf" ~/.config/mpd
ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config
ln -sfv "$DOTFILES_DIR/other/.ycm_extra_conf.py" ~

mkdir -p ~/.ncmpcpp
ln -sfv "$DOTFILES_DIR/other/config" ~/.ncmpcpp

mkdir -p ~/.config/sublime-text-3/Packages
rm -rf ~/.config/sublime-text-3/Packages/User
ln -sfnv "$DOTFILES_DIR/sublime/User" ~/.config/sublime-text-3/Packages

rm -rf ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall -c q! -c q!
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
~/.vim/plugged/youcompleteme/install.py --clang-completer
