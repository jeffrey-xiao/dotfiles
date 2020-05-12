#!/usr/bin/env bash

config_dir=${XDG_CONFIG_HOME:-"$HOME/.config"}
bash_config_dir=$config_dir/bash

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
  *) return ;;
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
shopt -s extglob
shopt -s globstar

# Enable vi mode.
set -o vi

# Enable color output.
DIRCOLORS=""
[ -e "$HOME/.dircolors" ] && DIRCOLORS="$HOME/.dircolors"
[ -x "$(command -v dircolors)" ] && eval "$(dircolors --bourne-shell "$DIRCOLORS")"

# Enable programmable completion features.
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -f "$config_dir/fzf/fzf.bash" ] && . "$config_dir/fzf/fzf.bash"
[ -f "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Bash prompt.
[ -f "$bash_config_dir/bash_twoline_simple" ] && . "$bash_config_dir/bash_twoline_simple"

# Alias definitions.
[ -f "$bash_config_dir/bash_aliases" ] && . "$bash_config_dir/bash_aliases"

# Function definitions.
[ -f "$bash_config_dir/bash_functions" ] && . "$bash_config_dir/bash_functions"

# Bash bookmarks.
[ -f "$bash_config_dir/bash_bookmarks" ] && . "$bash_config_dir/bash_bookmarks"

# Nvm.
[ -f "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use

# Add ssh keys.
ssh-add -l >/dev/null || ssh-add
