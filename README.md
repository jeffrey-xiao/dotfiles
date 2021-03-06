# dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Busy Screen](screenshots/busy.png)

This repository contains all the dotfiles I use for my Solus machine.

## List of Software

```
audio player         → mpc, mpd, ncmpcpp
compositor           → picom
document viewer      → zathura
file manager         → ranger
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
window manager       → bspwm
```

### Code Formatters, Linters, and Language Servers

```
Bash         → shfmt
C++          → clangd, clang-format, cppcheck
Elixir       → elixir-ls, mix-format
Go           → gofmt
Java         → clang-format
JavaScript   → javascript-typescript-langserver, eslint, prettier
Python       → autopep, flake8, pylint, python-language-server, yapf
Rust         → clippy, rust-analyzer, rustfmt
```

Configuration files are found in [`misc/`](misc/).

## Dependencies

A full list of dependencies and installed software will appear in `install.log` when using the
included bash scripts. Alternatively, you can check [`config.yaml`](config.yaml) to see the
dependencies by package.

## Installation

### With included bash scripts

```
git clone --depth=1 https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
git submodule update --init --depth=1
./symlink
./install
```

Any errors with the installation will appear in `install.log`.

### With [`dotinstall`](https://github.com/jeffrey-xiao/dotinstall)

```
git clone --depth=1 https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
git submodule update --init --depth=1
pip3 install dotinstall
dotinstall
```

## Color Scheme

The color scheme used is `solarized-dark`. Most programs will take the colors in `.Xresources` with
the exception of the colors in `dircolors`, `ranger`, and `weechat`.

## Personal Configuration

- [`bin/brightness`](bin/brightness): Change the path to the system internals interface for the
  backlight device.
- [`bin/bspwm-distribute-desktops`](bin/bspwm-distribute-desktops): Change number of desktops.
- [`bin/download-album-art`](bin/download-album-art): Define `LAST_FM_KEY`.
- [`bin/get-cpu-temperature`](bin/get-cpu-temperature): Change the path to the system internals
  interface for the thermal device.
- [`bin/get-weather`](bin/get-weather): Define `OPEN_WEATHER_MAP_KEY`.
- [`bin/init-monitors`](bin/init-monitors): Change the monitor setup.
- [`bin/notify-battery`](bin/notify-battery): Change the path to the system internals interface for
  the power supply device.
- [`bin/robar-brightness-server`](bin/robar-brightness-server): Change the path to the system
  internals interface for the backlight device.
- [`bin/keyboard`](bin/keyboard): Change the keyboard device name.
- [`bin/touchpad`](bin/touchpad): Change the touchpad device name.
- [`bin/record`](bin/record): Change the PulseAudio device indexes.
- [`git/config`](git/config): Change the username and email.
- [`polybar/config`](polybar/config): Change the adapter and battery name.
- [`weechat/irc.conf`](weechat/irc.conf): Change the username and nicks.

## License

`dotfiles` is dual-licensed under the terms of either the MIT License or the Apache License
(Version 2.0).

See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT) for more details.
