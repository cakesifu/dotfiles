#!/usr/bin/env sh

exec swayidle -w \
  timeout 250 'my-lockscreen.sh -fork-on-lock' \
  timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' \
  before-sleep 'my-lockscreen.sh -fork-on-lock'
