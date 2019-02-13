# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.bin:$PATH"

# set PATH to include cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# set PATH to include fzf binaries
export PATH="$PATH:/home/jeffreyxiao/.fzf/bin"

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
export FZF_DEFAULT_COMMAND='ag -g ""'

# Setting rust src path
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Setting nvm dir
export NVM_DIR="$HOME/.nvm"
