#!/usr/bin/env bash

pacman -Sy \
# echo \
  git vim sudo neovim helix openssh chezmoi starship curl wget tree yq `# console` \
  alacritty firefox thunar oculante`# gui basics` \
  greetd greetd-tuigreet `# login` \
  hyprland xdg-desktop-portal-hyprland wdisplays hyprpaper waybar waylock wlogout rofi-wayland dunst swayidle wl-clipboard `# DE` \
  pipewire pipewire-audio pavucontrol `# audio` \
  ttf-firacode-nerd ttf-ubuntu-nerd ttf-ubuntu-mono-nerd ttf-jetbrains-mono-nerd ttf-sourcecodepro-nerd `# fonts` 
