#!/bin/sh

# set PATH so it includes user's private bin directories
export PATH="$HOME/.local/bin:$PATH"

# set PATH to include cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# set PATH to include fzf binaries
export PATH="$PATH:$HOME/.fzf/bin"

# Environment variables for mpd
export MPD_HOST=~/.config/mpd/socket
export MPD_PORT=6600

# Envinroment variables for default programs
export BROWSER=firefox
export EDITOR=vim
export PAGER=less
export SHELL=bash
export TERM=xterm-256color
export VISUAL=vim

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --hidden --filename-pattern ""'

# Setting rust src path
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Setting nvm dir
export NVM_DIR="$HOME/.nvm"

# Setting weechat home directory
export WEECHAT_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}/weechat
