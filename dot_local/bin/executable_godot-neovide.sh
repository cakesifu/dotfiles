#!/bin/sh

NVIM_SOCKET=/tmp/neovide.socket
if [ ! -S $NVIM_SOCKET ]; then
  # echo "starting neovide" | systemd-cat -t neovide-godot
  neovide -- --listen $NVIM_SOCKET
else
  # echo "socket alive, sending command: $@" | systemd-cat -t neovide-godot
  nvim --server $NVIM_SOCKET --headless "$@"
fi
