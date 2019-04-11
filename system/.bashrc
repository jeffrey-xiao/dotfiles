#!/usr/bin/env bash

CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}/bash"

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
  *) return;;
esac

# History config.
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist

# Check window size and update LINES and COLUMNS.
shopt -s checkwinsize

# Glob config.
shopt -s dotglob
shopt -s globstar
shopt -s nullglob

# Enable vi mode.
set -o vi

# Enable color support of ls.
DIRCOLORS=""
[ -e "$HOME/.dircolors" ] && DIRCOLORS="$HOME/.dircolors"
[ -x "$(command -v dircolors)" ] && eval "$(dircolors --bourne-shell "$DIRCOLORS")"

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Bash prompt.
. "$CONFIG_DIR/bash_twoline_simple"

# Alias definitions.
[ -f "$CONFIG_DIR/bash_aliases" ] && . "$CONFIG_DIR/bash_aliases"

# Function definitions.
[ -f "$CONFIG_DIR/bash_functions" ] && . "$CONFIG_DIR/bash_functions"

# Bash bookmarks.
[ -f "$CONFIG_DIR/bash_bookmarks" ] && . "$CONFIG_DIR/bash_bookmarks"

# Source fzf if directory exists.
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

# Source nvm if directory exists.
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
