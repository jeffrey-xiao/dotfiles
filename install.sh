#!/usr/bin/env bash

## Join array with delimiter
function join { local IFS="$1"; shift; echo "$*"; }

## Get current directory
DOTFILES_DIR=$(pwd)

log_file=$DOTFILES_DIR/install.log
echo -n "" > $log_file

declare -a programs=(
  compton
  dunst
  feh
  xset mkfontdir mkfontscale
  htop
  i3 scrot imagemagick i3lock rofi acpi sysstat feh jq blueman xbacklight gnome-settings-daemon network-manager xclip
  mpd mpc
  mpv
  ncmpcpp
  redshift youtube-dl p7zip cabextract
  polybar font-awesome-ttf
  ranger imagemagick w3m atool
  rtorrent
  rxvt-unicode xrdb
  tmux
  vim curl ack ctags pip llvm-clang nodejs pandoc cppcheck
  weechat
  xdotool poppler-devel texlive-devel girara-devel texlive-all
)
programs_string=$(join " " "${programs[@]}")
installed_program_list=$(eopkg li -i)

## Installing necessary applications (need to install component system.devel separately)
sudo eopkg it -y $programs_string
sudo eopkg it -yc system.devel

## Checking if applications are installed
for f in ${programs[@]}
do
  if [ $(echo $installed_program_list | grep -c "$f ") -eq 1 ]; then
    echo "$f successfully installed." >> $log_file
  else
    echo "$f failed to install." >> $log_file
  fi
done

## Reinstalling all vim packages via Plug and building YouCompleteMe
rm -rf ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall -c q! -c q!
mkdir -p ~/.vim/.undo ~/.vim/.backup ~/.vim/.swp ~/.tags
sudo pip install jedi flake8 autopep8
sudo npm install -g eslint tern
cd ~/.vim/plugged/tern_for_vim && npm install

## Installing powerline fonts
git clone https://github.com/powerline/fonts ~/fonts/powerline-fonts
. ~/fonts/install.sh
sudo rm /usr/share/fonts/conf.d/70-no-bitmaps.conf
sudo ln -sv /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf /usr/share/fonts/conf.d
fc-cache -fv

## Install zathura from source
mkdir -pv ~/Documents/source
git clone https://github.com/pwmt/zathura ~/Documents/source/zathura
git clone https://github.com/pwmt/zathura-pdf-poppler ~/Documents/source/zathura-pdf-poppler
git clone https://github.com/pwmt/zathura-ps ~/Documents/source/zathura-ps
cd ~/Documents/source/zathura && sudo make install
cd ~/Documents/source/zathura-pdf-poppler && sudo make install
cd ~/Documents/source/zathura-ps && sudo make install

xrdb ~/.Xresources
