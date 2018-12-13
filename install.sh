#!/bin/bash

## Join array with delimiter
join() {
  local IFS="$1"
  shift
  echo "$*"
}

## Get current directory
DOTFILES_DIR=$(pwd)

log_file=$DOTFILES_DIR/install.log
echo -n "" >"$log_file"

declare -a programs=(
  compton
  dunst
  feh
  xset mkfontdir mkfontscale
  htop
  i3 scrot slog imagemagick i3lock rofi acpi sysstat jq blueman xbacklight gnome-settings-daemon numix-gtk-theme papirus-icon-theme network-manager xclip
  mpd mpc
  mpv
  ncmpcpp
  redshift youtube-dl p7zip cabextract
  polybar font-awesome-ttf
  ranger imagemagick w3m atool highlight
  rtorrent
  rxvt-unicode xrdb
  tmux
  vim curl ack ctags pip llvm-clang nodejs pandoc cppcheck
  weechat
  xdotool zathura texlive-all
)
programs_string=$(join " " "${programs[@]}")
installed_program_list=$(eopkg li -i)

## Installing necessary applications (need to install component system.devel separately)
sudo eopkg it -y "$programs_string"
sudo eopkg it -yc system.devel

## Checking if applications are installed
for f in "${programs[@]}"; do
  if [ "$(echo "$installed_program_list" | grep -c "$f ")" -eq 1 ]; then
    echo "$f successfully installed." >>"$log_file"
  else
    echo "$f failed to install." >>"$log_file"
  fi
done

## Installing powerline fonts
git clone https://github.com/powerline/fonts ~/fonts/powerline-fonts
source ~/fonts/install.sh
sudo rm /usr/share/fonts/conf.d/70-no-bitmaps.conf
sudo ln -sv /usr/share/fontconfig/conf.avail/70-yes-bitmaps.conf /usr/share/fonts/conf.d
mkdir ~/.fonts
cp $DOTFILES_DIR/fonts/* ~/.fonts
cd ~/.fonts && mkfontdir
cd ~/.fonts && mkfontscale
fc-cache -fv

## Installing development related programs and tools
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall -c q! -c q!
curl -sL https://raw.githubusercontent.com/creationix/nvm/master/install.sh -o install_nvm.sh
chmod 775 install_nvm.sh
./install_nvm.sh
rm install_nvm.sh
sudo pip install jedi flake8 autopep8 pylint
sudo npm install -g eslint tern
cd ~/.vim/plugged/tern_for_vim && npm install
curl https://sh.rustup.rs -sSf | sh
rustup install nightly
rustup default nightly
rustup component add rust-src
rustup component add rustfmt-preview
cargo install clippy
cargo install racer
