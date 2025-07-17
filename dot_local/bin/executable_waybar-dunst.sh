#!/bin/bash

paused_status=$(dunstctl is-paused)

if [ "$paused_status" = "true" ]; then
  echo '{"text":"󰂛","class":"paused"}'
else
  echo '{"text":"󰂚","class":"active"}'
fi
