#!/bin/bash


USER_DIR=${USER_DIR:=$HOME}
ROOT_DIR=${ROOT_DIR:='/root'}
SYS_DIR=${ROOT_DIR:='/etc'}

PACKAGES_CONSOLE=(tmux openssh ack htop tree make bash-completion neovim starship
                  git networkmanager curl python python-neovim base-devel bat)
PACKAGES_DESKTOP=(rofi awesome firefox thunar volumeicon lxappearance-gtk3
                  pavucontrol alacritty galculator eog evince
                  gnome-themes-standard arandr xsel arc-gtk-theme arc-icon-theme
                  xcursor-pinux xcursor-premium
                  conky slock xss-lock xautolock redshift cbatticon ttf-inconsolata
                  ttf-bitstream-vera ttf-dejavu adobe-source-code-pro-fonts ttf-hack ttf-fira-code
                  ttf-roboto ttf-freefont ttf-droid ttf-ubuntu-font-family
                  network-manager-applet python-xdg
                  gitg tk)

debug() {
  [[ -n $DEBUG ]] && echo $@
}

check_deps() {
  hash stow >/dev/null 2>&1 || sudo pacman -S stow
}

install_config() {
  target_path=`realpath ${2}`
  mkdir -p "$target_path/.local/share"
  mkdir -p "$target_path/.config"

  debug "Installing config package:" $1 " -> " $target_path
  stow -v -t $target_path $1
}

install_packages() {
  case $1 in
    console)
      debug "Installing packages: " ${PACKAGES_CONSOLE[*]}
      pacman -Sy --needed ${PACKAGES_CONSOLE[*]}
      ;;
    desktop)
      debug "Installing packages: " ${PACKAGES_DESKTOP[*]}
      pacman -Sy --needed ${PACKAGES_DESKTOP[*]}
      ;;
  esac
}

help_message() {
  echo "Usage: install.sh [arg...]"
  echo "   config:user"
  echo "   config:root           -- requires sudo"
  echo "   packages:console"     -- requires sudo
  echo "   packages:desktop"     -- requires sudo
  echo " "
  echo " Other usage:"
  echo "   stow <package>        - to install some package config"
  echo "   sudo stow <package>   - install some package in a sys/root path"

}

check_deps

if [ $# -lt 1 ]; then
  help_message
  exit 1
fi

for ARG in "$@"
do
  case $ARG in
    config:user)
      install_config "apps" "$USER_DIR"
      install_config "aur-builds" "$USER_DIR"
      install_config "awesome" "$USER_DIR"
      install_config "bash" "$USER_DIR"
      install_config "bin" "$USER_DIR"
      install_config "conky" "$USER_DIR"
      install_config "fonts" "$USER_DIR"
      install_config "git" "$USER_DIR"
      install_config "nvim" "$USER_DIR"
      install_config "tmux" "$USER_DIR"
      install_config "termite" "$USER_DIR"
      install_config "alacritty" "$USER_DIR"
      install_config "bat" "$USER_DIR"
      install_config "starship" "$USER_DIR"
      ;;
    config:root)
      install_config "bash" "$ROOT_DIR"
      install_config "nvim" "$ROOT_DIR"
      install_config "tmux" "$ROOT_DIR"
      install_config "bat" "$ROOT_DIR"
      install_config "starship" "$ROOT_DIR"
      ;;
    packages:desktop)
      install_packages console
      install_packages desktop
      ;;
    packages:console)
      install_packages console
      ;;
  esac

done
