#!/bin/bash

# Updated: We format it to show "Title [Address]" and tell Rofi to use the address for moving
window=$(hyprctl -j clients | jq -r '.[] | select(.workspace.name == "special:minimized") | "\(.title) [\(.address)]"' | rofi -dmenu -p "Restore Window:")

if [ -n "$window" ]; then
    # Extract the address from the brackets at the end
    addr=$(echo "$window" | grep -oP '\[\K[^\]]+')
    
    # Move it to the current active workspace
    active_ws=$(hyprctl -j activeworkspace | jq -r .id)
    hyprctl dispatch movetoworkspace "$active_ws",address:"$addr"
    hyprctl dispatch focuswindow address:"$addr"
fi
