# dotfiles

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Busy Screen](screenshots/busy.png)

This repository contains all the dotfiles I use for my Solus machine.

## List of Software

```
audio player         → mpc, mpd, ncmpcpp
compositor           → compton
document viewer      → zathura
file manager         → nautilus, ranger
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

### Code Formatters

```
clang-format → C++, Java
gofmt        → Go
mix-format   → Elixir
prettier     → HTML, CSS, JavaScript, JSON, YAML
rustfmt      → Rust
shfmt        → Bash
yapf         → Python
```

Some configuration files for these formatters are found in `misc/`.

## Dependencies

A full list of dependencies and installed software will appear in `install.log` when using the
included bash scripts. Alternatively, you can check `config.yaml` to see the dependencies by
package.

## Installation

### With included bash scripts

```
git clone https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
./symlink.sh
./install.sh
```

Any errors with the installation will appear in `install.log`.

### With [`dotinstall`](https://github.com/jeffrey-xiao/dotinstall)

```
git clone https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
pip3 install dotinstall
dotinstall
```

## Color Scheme

The color scheme used is `solarized-dark`. Most programs will take the colors in `.Xresources` with
the exception of the transparent background in `urxvt`, the shades in `polybar`, and the colors in
`dircolors`, `ranger`, `vim`, and `weechat`.

## Personal Configuration

- [`bin/get-weather`](bin/get-weather): Change the API key
- [`bin/change-brightness`](bin/change-brightness): Change the path to the system internals
  interface for the backlight device.
- [`bin/get-cpu-temperature`](bin/get-cpu-temperature): Change the path to the system internals
  interface for the thermal device.
- [`bin/notify-battery`](bin/notify-battery): Change the path to the system internals interface for
  the power supply device.
- [`bin/setup-displays`](bin/setup-displays): Change the monitor setup.
- [`bin/toggle-keyboard`](bin/toggle-keyboard): Change the keyboard device name.
- [`bin/toggle-touchpad`](bin/toggle-touchpad): Change the touchpad device name.
- [`polybar/config`]()
- [`git/.gitconfig`](git/.gitconfig): Change the username and email.
- [`misc/redshift.conf`](misc/redshift.conf): Change the location.
- [`mpd/mpd.conf`](mpd/mpd.conf): Change the user.
- [`polybar/config`](polybar/config): Change the adapter and battery name, and wired and WiFi
  interfaces.
- [`weechat/irc.conf`](weechat/irc.conf): Change the username and nicks.

## License

`dotfiles` is dual-licensed under the terms of either the MIT License or the Apache License
(Version 2.0).

See [LICENSE-APACHE](LICENSE-APACHE) and [LICENSE-MIT](LICENSE-MIT) for more details.
