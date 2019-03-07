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
shopt -s dotglob

# If set, the pattern "**" used in a pathname expansion context will match all
# files and zero or more directories and subdirectories.
shopt -s globstar

# Bash prompt.
. "$CONFIG_DIR/bash_twoline_simple"

# Enable color support of ls.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors --bourne-shell ~/.dircolors)" || eval "$(dircolors --bourne-shell)"
fi

# Colored GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
[ -f "$CONFIG_DIR/bash_aliases" ] && . "$CONFIG_DIR/bash_aliases"

# Function definitions.
[ -f "$CONFIG_DIR/bash_functions" ] && . "$CONFIG_DIR/bash_functions"

# Bash bookmarks.
[ -f "$CONFIG_DIR/bash_bookmarks" ] && . "$CONFIG_DIR/bash_bookmarks"

# Enable vi mode.
set -o vi

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source fzf if directory exists.
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

# Source nvm if directory exists.
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
