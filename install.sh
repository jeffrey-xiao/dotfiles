#!/usr/bin/env bash

# Saves current changes in the directory and pulls from remote
git stash
git pull
git stash apply

# Get current directory
export DOTFILES_DIR

DOTFILES_DIR=$(pwd)

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vim" ~

ln -sfv "$DOTFILES_DIR/system/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/system/.bashrc" ~
ln -sfv "$DOTFILES_DIR/system/.dircolors" ~
ln -sfv "$DOTFILES_DIR/system/.profile" ~
ln -sfv "$DOTFILES_DIR/system/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/system/.inputrc" ~

ln -sfv "$DOTFILES_DIR/other/redshift.conf" ~/.config

for obj in $DOTFILES_DIR/sublime/*
do
	ln -sfv "$obj" ~/.config/sublime-text-3/Packages/User/
done
