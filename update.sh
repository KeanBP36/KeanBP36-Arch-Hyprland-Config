#!/bin/bash

# 1. Ensure the directory exists
mkdir -p "$HOME/dotfiles"

# 2. If it's not a git repo yet, clone it (or initialize it)
if [ ! -d "$HOME/dotfiles/.git" ]; then
    echo "Initializing dotfiles repository..."
    cd "$HOME/dotfiles"
    git init
    git remote add origin https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git
    git fetch
    git checkout main || git checkout master
else
    echo "Pulling latest updates..."
    cd "$HOME/dotfiles"
    git pull origin main
fi

# 3. Refresh Symlinks (The overwrite logic)
echo "Refreshing symlinks..."

# Manually link home files
ln -sfT "$HOME/dotfiles/.bashrc" "$HOME/.bashrc"
ln -sfT "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

# Automatically link .config folders
mkdir -p "$HOME/.config"
for dir in fastfetch hypr rofi waybar; do
    if [ -d "$HOME/dotfiles/$dir" ]; then
        # -sfT will force overwrite the symlink if it exists
        ln -sfT "$HOME/dotfiles/$dir" "$HOME/.config/$dir"
        echo "Linked $dir"
    fi
done

echo "System configuration is fully up to date!"
