#!/bin/bash
set -e

DOTFILES_REPO="https://github.com/youruser/dotfiles.git"  # <-- set this

echo "Updating system and installing packages..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git firefox kitty rofi-wayland waybar fastfetch hyprlock swww zsh

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Dotfiles not found. Cloning..."
    git clone "$DOTFILES_REPO" "$HOME/dotfiles"
fi

mkdir -p "$HOME/.config"

echo "Creating symlinks..."
ln -sf "$HOME/dotfiles/hypr"       "$HOME/.config/hypr"
ln -sf "$HOME/dotfiles/waybar"     "$HOME/.config/waybar"
ln -sf "$HOME/dotfiles/rofi"       "$HOME/.config/rofi"
ln -sf "$HOME/dotfiles/fastfetch"  "$HOME/.config/fastfetch"
ln -sf "$HOME/dotfiles/.zshrc"     "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.bashrc"    "$HOME/.bashrc"

echo "Install complete! Please restart your terminal or log out/in."
