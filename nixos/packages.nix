{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # basics
    alacritty

    # browsers
    firefox-bin

    # desktop environment
    rofi-wayland
    wlogout
    waylock
    wdisplays
    waybar
    xdg-desktop-portal-hyprland
  ];
}
