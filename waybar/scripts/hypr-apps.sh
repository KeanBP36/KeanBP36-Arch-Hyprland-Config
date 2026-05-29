#!/bin/bash

hyprctl clients -j | jq -r '
  group_by(.workspace.id)[] |
  "\(.[0].workspace.id): " + (map(.class) | join(", "))
'
