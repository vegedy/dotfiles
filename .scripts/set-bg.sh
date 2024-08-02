#!/usr/bin/env sh

BG_IMAGE=$HOME/.config/bg.png

if [[ "$1" ]]; then
  cp "$1" "$BG_IMAGE"
  notify-send "Setting new background" "$1"
fi

feh --bg-fill "$BG_IMAGE"
wal -n -i "$BG_IMAGE"

