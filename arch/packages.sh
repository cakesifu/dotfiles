#!/usr/bin/env bash

sudo pacman -Sy \
# echo \
  git vim sudo neovim helix openssh chezmoi starship `# console` \
  alacritty firefox thunar `# gui basics` \
  hyprland xdg-desktop-portal-hyprland wdisplays hyprpaper waybar waylock wlogout rofi-wayland dunst swayidle wl-clipboard `# DE` \
  pipewire pipewire-audio pavucontrol `# audio` \
  ttf-firacode-nerd ttf-ubuntu-nerd ttf-ubuntu-mono-nerd ttf-jetbrains-mono-nerd ttf-sourcecodepro-nerd `# fonts` 
