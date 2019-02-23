#!/usr/bin/env sh

[ -f ~/.bashrc ] && . ~/.bashrc
[ -f ~/.profile ] && . ~/.profile

export PATH="$HOME/.cargo/bin:$PATH"
