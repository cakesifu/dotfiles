#!/usr/bin/env sh

monitor=$(hyprctl monitors -j | jq -r ".[] | select(.focused==true).id")
hyprctl dispatch $2 "${monitor}0$1"