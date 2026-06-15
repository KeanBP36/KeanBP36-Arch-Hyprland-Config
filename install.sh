#!/bin/bash
set -e

# --- Configuration ---
DEST_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git"

echo "Updating system..."
sudo pacman -Syu --noconfirm
# Install basic requirements from official repos
sudo pacman -S --noconfirm git firefox kitty waybar fastfetch hyprlock zsh

# Ensure we have an AUR helper (if you don't have yay, this handles it)
if ! command -v yay &> /dev/null; then
    echo "Installing yay (AUR helper)..."
    sudo pacman -S --noconfirm --needed base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
fi

# Clone or Update dotfiles
if [ ! -d "$DEST_DIR" ]; then
    echo "Cloning dotfiles..."
    git clone "$REPO_URL" "$DEST_DIR"
else
    echo "Dotfiles already exist. Pulling latest changes..."
    (cd "$DEST_DIR" && git pull)
fi

echo "Installing AUR packages..."
yay -S --noconfirm rofi-wayland swww

echo "Cleaning up old configs and applying new ones..."
# Only delete AFTER verifying we have the new files
rm -rf "$HOME/.config/hypr"
rm -rf "$HOME/.config/waybar"
rm -rf "$HOME/.config/rofi"
rm -rf "$HOME/.config/fastfetch"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.bashrc"

mkdir -p "$HOME/.config"

# Create symlinks
sleep 1
ln -sfn "$DEST_DIR/hypr"      "$HOME/.config/hypr"
ln -sfn "$DEST_DIR/waybar"    "$HOME/.config/waybar"
ln -sfn "$DEST_DIR/rofi"      "$HOME/.config/rofi"
ln -sfn "$DEST_DIR/fastfetch" "$HOME/.config/fastfetch"
ln -sf  "$DEST_DIR/.zshrc"    "$HOME/.zshrc"
ln -sf  "$DEST_DIR/.bashrc"   "$HOME/.bashrc"

echo "Install complete! Please restart your terminal or log out/in."
