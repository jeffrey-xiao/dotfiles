## Dotfiles
This repository contains all the dot files I use for my Ubuntu machine.

## Software I Use
```
audio         → ncmpcpp/mpd/mpc
de/wm         → i3-gaps
editor        → vim/sublime/eclipse
fm            → nautilus/ranger
irc           → weechat
monitor       → i3blocks-gaps/htop
multiplexer   → tmux
notifications → dunst
shell         → bash
terminal      → rxvt-unicode
torrent       → rtorrent
video         → mpv
viewer        → qpdfview
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
git submodule update --init --recursive
pip3 install -r ./dotinstall/requirements.txt
python3 ./dotinstall/install.py
~~~


## Personal Use
 - change the username and email in `git/.gitconfig`
 - change the user in `mpd/mpd.conf`
 - change the location in `other/redshift.conf`
 - change the city in `system/.profile`
 - change the API key in `bin/weather`
 - change the username and nicks in `weechat/irc.conf`
 - change the flags for `YouCompleteMe` in `vim/.ycm_extra_conf.py`

Everything else works out of the box.
