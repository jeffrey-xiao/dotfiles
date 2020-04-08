#!/bin/sh

config_dir=${XDG_CONFIG_HOME:-"$HOME/.config"}
bash_config_dir=$config_dir/bash

# Set PATH to include user's bin directories, cargo binaries, fzf binaries, and mix scripts.
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.fzf/bin:$HOME/.mix/escripts"

# Environment variables for mpd.
export MPD_HOST=/tmp/mpd
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
export RXVT_SOCKET="/tmp/urxvtd"

# Setting bspwm socket.
export BSPWM_SOCKET="/tmp/bspwm"

# Setting bash secrets.
[ -f "$bash_config_dir/bash_secrets" ] && . "$bash_config_dir/bash_secrets"

# Starting ssh agent if it hasn't been started and symlink SSH_AUTH_SOCK for
# tmux sessions.
if [ ! -e ~/.ssh/ssh_auth_sock ]; then
  if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent)"
  fi
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi
