# Make destructive commands more interactive and verbose
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

# Extensions for ls
alias ll='ls -lF --color=auto'
alias lla='ls -alF --color=auto'
alias la='ls -aF --color=auto'
alias ls='ls -F --color=auto'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal ||     echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*ale    rt$//'\'')"'
