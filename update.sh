#!/bin/bash
# ~/dotfiles/update.sh - Automatically sync and link configs

if [ ! -d "$HOME/dotfiles/.git" ]; then
    echo "Error: ~/dotfiles does not appear to be a git repository."
    exit 1
fi

echo "Pulling latest configs from GitHub..."
cd "$HOME/dotfiles" || { echo "Directory not found!"; exit 1; }
git pull

echo "Refreshing symlinks..."

# 1. Manually link dotfiles in home directory
ln -sfT "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
ln -sfT "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

# 2. Automatically link directories in ~/.config
mkdir -p "$HOME/.config"
for dir in fastfetch hypr rofi waybar; do
    if [ -d "$HOME/dotfiles/$dir" ]; then
        ln -sfT "$HOME/dotfiles/$dir" "$HOME/.config/$dir"
        echo "Linked $dir"
    fi
done

echo "System configuration is fully up to date!"
