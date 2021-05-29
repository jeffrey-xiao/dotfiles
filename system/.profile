#!/bin/sh

config_dir=${XDG_CONFIG_HOME:-"$HOME/.config"}
data_dir=${XDG_DATA_HOME:-"$HOME/.local/share"}
runtime_dir=${XDG_RUNTIME_DIR:-"/run/user/$UID"}

# Set PATH to include user's bin directories.
export PATH="$PATH:$HOME/.local/bin"
# Include cargo, mix, java, n, and npm binaries.
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.mix/escripts:/usr/lib64/openjdk-11/bin:$data_dir/n/bin:$data_dir/npm/bin"

# Environment variables for default programs.
export BROWSER=firefox
export EDITOR=vim
export PAGER=less
export SHELL=bash
export TERM=xterm-256color
export VISUAL=vim

# Environment variables for mpd.
export MPD_HOST=/tmp/mpd
export MPD_PORT=6600

# Environment variables for XDG Base Directory Specification.
export GTK2_RC_FILES="$config_dir/gtk-2.0/gtkrc"
export INPUTRC="$config_dir/bash/inputrc"
export LESSHISTFILE="$runtime_dir/less/history"
export N_PREFIX="$data_dir/n"
export PYLINTHOME="$data_dir/pylint"
export WEECHAT_HOME="$config_dir/weechat"
export BSPWM_SOCKET="$runtime_dir/bspwm.socket"
export RXVT_SOCKET="$runtime_dir/urxvtd.socket"

# Setting bash secrets.
[ -f "$config_dir/bash/bash_secrets" ] && . "$config_dir/bash/bash_secrets"

# Setting rg as the default source for fzf, falling back to ag and ack.
if [ -x "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --hidden --files'
fi

[ -z "$SSH_AUTH_SOCK" ] &&
  [ -z "$SSH_AGENT" ] &&
  eval "$(ssh-agent)"
