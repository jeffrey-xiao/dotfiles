# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History config
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Check window size and update LINES and COLUMNS
shopt -s checkwinsize
shopt -s dotglob

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Bash prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi
. ~/.bash_twoline.sh
unset color_prompt force_color_prompt

# Set title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Function definitions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Environment variables for MPD
export MPD_HOST=~/.config/mpd/socket
export MPD_PORT=6600

# Envinroment variables for ranger
export EDITOR=vim
export PAGER=less
