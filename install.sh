#!/bin/bash
set -e

# --- Configuration ---
DEST_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git"

echo "Updating system..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git firefox kitty waybar fastfetch hyprlock zsh

# Ensure AUR helper
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
    echo "Updating existing dotfiles..."
    (cd "$DEST_DIR" && git pull)
fi

echo "Installing AUR packages..."
yay -S --noconfirm rofi-wayland swww

echo "Applying configs..."
mkdir -p "$HOME/.config"

# Remove old configs safely (using || true so it doesn't exit on error)
rm -rf "$HOME/.config/hypr" || true
rm -rf "$HOME/.config/waybar" || true
rm -rf "$HOME/.config/rofi" || true
rm -rf "$HOME/.config/fastfetch" || true
rm -f "$HOME/.zshrc" || true
rm -f "$HOME/.bashrc" || true

# Function to safely create symlinks
link_config() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        ln -sfn "$1" "$2"
        echo "Linked: $2"
    else
        echo "WARNING: Source $1 not found, skipping."
    fi
}

# Create symlinks
link_config "$DEST_DIR/hypr"      "$HOME/.config/hypr"
link_config "$DEST_DIR/waybar"    "$HOME/.config/waybar"
link_config "$DEST_DIR/rofi"      "$HOME/.config/rofi"
link_config "$DEST_DIR/fastfetch" "$HOME/.config/fastfetch"
link_config "$DEST_DIR/.zshrc"    "$HOME/.zshrc"
link_config "$DEST_DIR/.bashrc"   "$HOME/.bashrc"

echo "Install complete! Please edit ~/.config/hypr/hyprland.conf to configure your GPU."
