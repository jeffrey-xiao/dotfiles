#!/bin/sh

config_dir="${XDG_CONFIG_HOME:-"$HOME/.config"}"
bash_config_dir=$config_dir/bash

# Set PATH so it includes user's bin directories.
export PATH="$PATH:$HOME/.local/bin"

# Set PATH to include cargo binaries.
export PATH="$PATH:$HOME/.cargo/bin"

# Set PATH to include fzf binaries.
export PATH="$PATH:$HOME/.fzf/bin"

# Set PATH to include mix scripts.
export PATH="$PATH:$HOME/.mix/escripts"

# Environment variables for mpd.
export MPD_HOST=~/.config/mpd/socket
export MPD_PORT=6600

# Environment variables for default programs.
export BROWSER=firefox
export EDITOR=vim
export PAGER=less
export SHELL=bash
export TERM=xterm-256color
export VISUAL=vim

# Setting ag as the default source for fzf.
[ -x "$(command -v ag)" ] && export FZF_DEFAULT_COMMAND='ag --hidden --filename-pattern ""'

# Setting rust src path.
[ -x "$(command -v rustc)" ] && sysroot=$(rustc --print sysroot) && export RUST_SRC_PATH="$sysroot/lib/rustlib/src/rust/src"

# Setting nvm dir.
export NVM_DIR="$HOME/.nvm"

# Setting weechat home directory.
export WEECHAT_HOME="$config_dir/weechat"

# Setting urxvtd socket.
hostname=$(uname -n) && export RXVT_SOCKET=/tmp/urxvtd-$hostname

# Bash secrets.
[ -f "$bash_config_dir/bash_secrets" ] && . "$bash_config_dir/bash_secrets"
