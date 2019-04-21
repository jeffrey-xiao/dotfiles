#!/bin/sh

config_dir="${XDG_CONFIG_HOME:-"$HOME/.config"}"
bash_config_dir=$config_dir/bash

# Set PATH so it includes user's private bin directories
export PATH="$PATH:$HOME/.local/bin"

# Set PATH to include cargo binaries.
export PATH="$PATH:$HOME/.cargo/bin"

# Set PATH to include fzf binaries.
export PATH="$PATH:$HOME/.fzf/bin"

# Environment variables for mpd.
export MPD_HOST=~/.config/mpd/socket
export MPD_PORT=6600

# Envinroment variables for default programs.
export BROWSER=firefox
export EDITOR=vim
export PAGER=less
export SHELL=bash
export TERM=xterm-256color
export VISUAL=vim

# Setting ag as the default source for fzf.
export FZF_DEFAULT_COMMAND='ag --hidden --filename-pattern ""'

# Setting rust src path.
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Setting nvm dir.
export NVM_DIR="$HOME/.nvm"

# Setting weechat home directory.
export WEECHAT_HOME=$config_dir/weechat

# Bash secrets.
[ -f "$bash_config_dir/bash_secrets" ] && . "$bash_config_dir/bash_secrets"
