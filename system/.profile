# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.bin:$PATH"

# set PATH to include cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# set PATH to include other binaries
export PATH="$HOME/Documents/source/arcanist/bin:$HOME/Documents/workspace/datasources/admin-cli/bin:$PATH"

# Environment variables for MPD
export MPD_HOST=~/.config/mpd/socket
export MPD_PORT=6600

# Envinroment variables for ranger
export EDITOR=vim
export PAGER=less

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# Setting rust src path
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Setting nvm dir
export NVM_DIR="$HOME/.nvm"
