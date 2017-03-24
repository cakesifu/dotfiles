#!/bin/bash

Xephyr -ac -br -noreset -screen 800x600 :1.0 &
sleep 3

export DISPLAY=:1.0
export AWESOME_CONFIG_FILE="test"

awesome -c rc.lua
