#!/bin/bash
# ~/dotfiles/update.sh - Intelligent update script

# 1. Update from GitHub
echo "Pulling latest configs from GitHub..."
git pull

# 2. Refresh Symlinks
# -s: symbolic link, -f: force (overwrite), -T: treat as directory
echo "Syncing symlinks..."
ln -sfT ~/dotfiles/.bashrc ~/.bashrc
ln -sfT ~/dotfiles/hypr ~/.config/hypr
# Add any future folders here, e.g.:
# ln -sfT ~/dotfiles/waybar ~/.config/waybar

echo "System configuration is up to date!"
