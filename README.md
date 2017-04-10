## Dotfiles
This repository contains all the dot files I use for my Ubuntu machine.

## Software I Use
```
terminal    → rxvt-unicode
shell       → bash
editor      → vim/sublime/eclipse
audio       → ncmpcpp/mpd/mpc
irc         → weechat
fm          → nautilus/ranger
de/wm       → i3-gaps
monitor     → i3blocks-gaps/htop
multiplexer → tmux
video       → mpv
viewer      → qpdfview
```

## Dependencies
```
scrot
imagemagick
fonts-font-awesome
redshift
compton
i3lock
```

## Installation
~~~
git clone https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
. ./install.sh
. ./symlink.sh
~~~

Any errors with the installation will appear in `./install.log`.

## Personal Use
 - change the username and email in `.gitconfig`
 - change the user in `mpd.conf`
 - change the location in `redshift.conf`
