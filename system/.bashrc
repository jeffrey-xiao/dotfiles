#!/usr/bin/env bash

config_dir=${XDG_CONFIG_HOME:-"$HOME/.config"}
data_dir=${XDG_DATA_HOME:-"$HOME/.local/share"}

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
  *) return ;;
esac

# History config.
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILE="$data_dir/bash/history"
HISTFILESIZE=20000
shopt -s histappend
shopt -s cmdhist

# Check window size and update LINES and COLUMNS.
shopt -s checkwinsize

# Glob config.
shopt -s dotglob
shopt -s extglob
shopt -s globstar

# Enable vi mode.
set -o vi

# Enable ls color output.
[ -f "$config_dir/bash/dircolors" ] &&
  [ -x "$(command -v dircolors)" ] &&
  eval "$(dircolors --bourne-shell "$config_dir/bash/dircolors")"

# Enable programmable completion features.
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -f "$config_dir/fzf/fzf.bash" ] && . "$config_dir/fzf/fzf.bash"

# Bash specific configuration.
[ -f "$config_dir/bash/bash_twoline_simple" ] && . "$config_dir/bash/bash_twoline_simple"
[ -f "$config_dir/bash/bash_aliases" ] && . "$config_dir/bash/bash_aliases"
[ -f "$config_dir/bash/bash_functions" ] && . "$config_dir/bash/bash_functions"
[ -f "$config_dir/bash/bash_bookmarks" ] && . "$config_dir/bash/bash_bookmarks"

# Add ssh keys.
ssh-add -l >/dev/null || ssh-add
