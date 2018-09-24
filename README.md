# dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This repository contains all the dotfiles I use for my Solus machine.

## List of Software

```
audio                → mpc/mpd/ncmpcpp
compositor           → compton
document viewer      → zathura
file manager         → nautilus/ranger
irc client           → weechat
media player         → mpv
notification daemon  → dunst
shell                → bash
status bar           → polybar
system monitor       → htop
terminal emulator    → rxvt-unicode
terminal multiplexer → tmux
text editor          → vim
torrent client       → rtorrent
window manager       → i3-gaps
```

## Dependencies

A full list of dependencies and installed software will appear in `./install.log` when using bash
script. Alternatively, you can check `./config.yaml` to see the dependencies by package.

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

## Color Scheme

The color scheme used is `solarized-dark`. Most programs will take the colors in `.Xresources` with
the exception of the transparent background in `urxvt`, the shades in `polybar`, and the colors in
`dircolors`, `ranger`, `vim`, and `weechat`.

## Personal Use

 - change the API key in `bin/get-weather`
 - change the adapter and battery name, and wired and wifi interfaces in `polybar/config`
 - change the location in `other/redshift.conf`
 - change the user in `mpd/mpd.conf`
 - change the username and email in `git/.gitconfig`
 - change the username and nicks in `weechat/irc.conf`

Everything else works out of the box.

## License

`dotfiles` is dual-licensed under the terms of either the MIT License or the Apache License
(Version 2.0).

See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT) for more details.
