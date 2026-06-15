#!/bin/bash
set -e

# --- Configuration ---
# Ensure this matches the folder name created by git clone
# If it clones as 'KeanBP36-Arch-Hyprland-Config', change this:
DEST_DIR="$HOME/dotfiles"

echo "Cleaning up old configurations..."
# Remove only if they are not already the correct symlinks
rm -rf "$HOME/.config/hypr"
rm -rf "$HOME/.config/waybar"
rm -rf "$HOME/.config/rofi"
rm -rf "$HOME/.config/fastfetch"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.bashrc"

echo "Updating system and installing packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git firefox kitty rofi-wayland waybar fastfetch hyprlock swww zsh

if [ ! -d "$DEST_DIR" ]; then
    echo "Cloning dotfiles..."
    git clone "https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git" "$DEST_DIR"
else
    echo "Dotfiles already exist. Pulling latest changes..."
    cd "$DEST_DIR" && git pull
fi

mkdir -p "$HOME/.config"

echo "Creating symlinks..."
# -sfn ensures we link correctly and don't create links-inside-links
ln -sfn "$DEST_DIR/hypr"      "$HOME/.config/hypr"
ln -sfn "$DEST_DIR/waybar"    "$HOME/.config/waybar"
ln -sfn "$DEST_DIR/rofi"      "$HOME/.config/rofi"
ln -sfn "$DEST_DIR/fastfetch" "$HOME/.config/fastfetch"
ln -sf  "$DEST_DIR/.zshrc"    "$HOME/.zshrc"
ln -sf  "$DEST_DIR/.bashrc"   "$HOME/.bashrc"

echo "Install complete! Please restart your terminal or log out/in."
