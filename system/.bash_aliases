# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Make destructive commands more interactive and verbose
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'

# Safety net
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Extensions for ls
alias ll='ls -lhF --color=auto'
alias lla='ls -alhF --color=auto'
alias la='ls -aF --color=auto'
alias ls='ls -F --color=auto'

# Colored grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Handy shortcuts
alias h='history'
alias j='jobs -l'
alias mkdir='mkdir -pv'

# Screenshot directly to clipboard
alias ssclip='scrot ~/.tmp/tmp.png && xclip ~/.tmp/tmp.png -selection clipboard -t image/png && rm ~/.tmp/tmp.png -f'
alias ssclip-area='scrot -s ~/.tmp/tmp.png && xclip ~/.tmp/tmp.png -selection clipboard -t image/png && rm ~/.tmp/tmp.png -f'

# Vim aliases
alias vim='vim --servername VIM'

# Add an "alert" alias for long running commands.  Use like so:
# 	sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal ||     echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*ale    rt$//'\'')"'
