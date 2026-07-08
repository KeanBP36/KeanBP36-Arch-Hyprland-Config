#!/bin/bash
# Force the environment to recognize the display
export DISPLAY=:0
export WAYLAND_DISPLAY=wayland-1

# Define absolute paths
GRIM=/usr/bin/grimblast
SWAPPY=/usr/bin/swappy
TMP="/tmp/screenshot_edit.png"

# Execute
$GRIM save "$1" "$TMP"
$SWAPPY -f "$TMP"
rm "$TMP"
