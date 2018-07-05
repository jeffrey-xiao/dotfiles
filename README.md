## Dotfiles
This repository contains all the dot files I use for my Solus machine.

## Software I Use
```
audio         → ncmpcpp/mpd/mpc
de/wm         → i3-gaps
editor        → vim
fm            → ranger
irc           → weechat
monitor       → polybar/htop
multiplexer   → tmux
notifications → dunst
pdf viewer    → zathura
shell         → bash
terminal      → rxvt-unicode
torrent       → rtorrent
video         → mpv
```

## Dependencies
A full list of dependencies and installed software will appear in `./install.log` when using bash script.
Alternatively, you can check `./config.yaml` to see the dependencies by package.

## Installation
### With included bash scripts
~~~
git clone https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
. ./install.sh
. ./symlink.sh
~~~
Any errors with the installation will appear in `./install.log`.

### With [dotinstall](https://github.com/jeffrey-xiao/dotinstall)
~~~
git clone https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
pip3 install dotinstall
dotinstall
~~~


## Personal Use
 - change the username and email in `git/.gitconfig`
 - change the user in `mpd/mpd.conf`
 - change the location in `other/redshift.conf`
 - change the API key in `bin/weather`
 - change the username and nicks in `weechat/irc.conf`

Everything else works out of the box.
