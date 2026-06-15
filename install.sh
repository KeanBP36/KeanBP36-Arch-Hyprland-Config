#!/bin/bash
set -e

# --- Configuration ---
# Update this with your actual repo
DOTFILES_REPO="https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git"

echo "Cleaning up old configurations to force overwrite..."
# Force remove existing configs to prevent conflicts
rm -rf "$HOME/.config/hypr"
rm -rf "$HOME/.config/waybar"
rm -rf "$HOME/.config/rofi"
rm -rf "$HOME/.config/fastfetch"
rm -rf "$HOME/.config/hyprland" # Removing this to fix your specific error
rm -f "$HOME/.zshrc"
rm -f "$HOME/.bashrc"

echo "Updating system and installing packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git firefox kitty rofi-wayland waybar fastfetch hyprlock swww zsh

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles..."
    git clone "$DOTFILES_REPO" "$HOME/dotfiles"
else
    echo "Dotfiles already exist. Pulling latest changes..."
    cd "$HOME/dotfiles" && git pull
fi

mkdir -p "$HOME/.config"

echo "Creating symlinks..."
ln -sf "$HOME/dotfiles/hypr"       "$HOME/.config/hypr"
ln -sf "$HOME/dotfiles/waybar"      "$HOME/.config/waybar"
ln -sf "$HOME/dotfiles/rofi"        "$HOME/.config/rofi"
ln -sf "$HOME/dotfiles/fastfetch"   "$HOME/.config/fastfetch"
ln -sf "$HOME/dotfiles/.zshrc"      "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.bashrc"     "$HOME/.bashrc"

echo "Install complete! Please restart your terminal or log out/in."
