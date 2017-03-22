#!/bin/bash

command -v stow >/dev/null 2>&1 || { echo >&2 "not installed.  Aborting."; exit 1; }

USER_DIR=${USER_DIR:=$HOME}
ROOT_DIR=${ROOT_DIR:='/root'}
SYS_DIR=${ROOT_DIR:='/etc'}

PACKAGES_CONSOLE=(tmux openssh ack htop tree make bash-completion neovim git networkmanager)
PACKAGES_DESKTOP=(rofi awesome chromium thunar volumeicon lxappearance gnome-themes-standard arandr
                  conky lightdm slock ttf-bitstream-vera
                  ttf-dejavu adobe-source-code-pro-fonts
                  gitg)

debug() {
  [[ -n $DEBUG ]] && echo $@
}

check_deps() {
  hash stow >/dev/null 2>&1 || pacman -S stow
  hash sudo >/dev/null 2>&1 || pacman -S sudo
}

install_config() {
  target_path=`realpath ${2}`
  debug "Installing config package:" $1 " -> " $target_path
  stow -n -t $target_path $1
}

install_packages() {
  case $1 in
    console)
      debug "Installing packages: " ${PACKAGES_CONSOLE[*]}
      pacman -Sy ${PACKAGES_CONSOLE[*]}
      ;;
    desktop)
      debug "Installing packages: " ${PACKAGES_DESKTOP[*]}
      pacman -Sy ${PACKAGES_DESKTOP[*]}
      ;;
  esac
}


for ARG in "$@"
do
  case $ARG in
    config:user)
      install_config "user" "$USER_DIR"
      ;;
    config:root)
      install_config "root" "$ROOT_DIR"
      ;;
    config:sys)
      install_config "sys" "$SYS_DIR"
      ;;

    packages:desktop)
      install_packages desktop
      ;;
    packages:console)
      install_packages console
      ;;
  esac

done
