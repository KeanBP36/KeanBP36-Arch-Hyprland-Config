#!/bin/bash
# ~/dotfiles/update.sh - Automatically link everything

echo "Pulling latest configs from GitHub..."
cd ~/dotfiles && git pull

echo "Refreshing symlinks..."

# 1. Manually link important single files
ln -sfT ~/dotfiles/.bashrc ~/.bashrc
ln -sfT ~/dotfiles/.zshrc ~/.zshrc

# 2. Automatically link all sub-directories (hypr, waybar, rofi, fastfetch)
# This loop finds all directories in ~/dotfiles and links them to ~/.config/
for dir in fastfetch hypr rofi waybar; do
    if [ -d "$dir" ]; then
        mkdir -p ~/.config
        ln -sfT ~/dotfiles/$dir ~/.config/$dir
        echo "Linked $dir"
    fi
done

echo "System configuration is fully up to date!"
