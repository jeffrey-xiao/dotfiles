# dotfiles
This repository contains all the dot files I use for my Ubuntu machine.

## Installation
### General Installation
~~~
git clone https://github.com/jeffrey-xiao/dotfiles.git
cd dotfiles
source ./install.sh
~~~
### Installing Vim Packages
~~~
:source %
:PlugInstall
~~~
### Build YouCompleteMe
~~~
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/plugged/youcompleteme
./install.py
~~~
