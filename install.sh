#!/bin/bash


USER_DIR=${USER_DIR:=$HOME}
ROOT_DIR=${ROOT_DIR:='/root'}
SYS_DIR=${ROOT_DIR:='/etc'}

PACKAGES_CONSOLE=(tmux openssh ack htop tree make bash-completion neovim git networkmanager curl)
PACKAGES_DESKTOP=(rofi awesome chromium thunar volumeicon lxappearance gnome-themes-standard arandr
                  conky lxdm slock redshift
                  ttf-bitstream-vera ttf-dejavu adobe-source-code-pro-fonts
                  gitg)

debug() {
  [[ -n $DEBUG ]] && echo $@
}

check_deps() {
  hash stow >/dev/null 2>&1 || sudo pacman -S stow
}

install_config() {
  target_path=`realpath ${2}`
  debug "Installing config package:" $1 " -> " $target_path
  stow -v -t $target_path $1
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

check_deps


for ARG in "$@"
do
  case $ARG in
    config:user)
      install_config "apps" "$USER_DIR"
      install_config "awesome" "$USER_DIR"
      install_config "aur-builds" "$USER_DIR"
      install_config "bash" "$USER_DIR"
      install_config "bin" "$USER_DIR"
      install_config "git" "$USER_DIR"
      install_config "nvim" "$USER_DIR"
      install_config "tmux" "$USER_DIR"
      ;;
    config:root)
      install_config "bash" "$ROOT_DIR"
      install_config "nvim" "$ROOT_DIR"
      install_config "tmux" "$ROOT_DIR"
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
