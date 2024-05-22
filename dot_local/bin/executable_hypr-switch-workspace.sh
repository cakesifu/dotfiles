#!/usr/bin/env sh

set -x
monitor=$(hyprctl monitors -j | jq -r ".[] | select(.focused==true).id")
exec hyprctl dispatch $2 "${monitor}0$1"
