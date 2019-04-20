#!/bin/sh

CONFIG_DIR="${XDG_CONFIG_HOME:-"$HOME/.config"}/bash"

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
export WEECHAT_HOME=$CONFIG_DIR/weechat

# Bash secrets.
[ -f "$CONFIG_DIR/bash_secrets" ] && . "$CONFIG_DIR/bash_secrets"
