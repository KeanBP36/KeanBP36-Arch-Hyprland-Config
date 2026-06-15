#!/bin/bash
# 1. Update system and install required apps
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm firefox kitty rofi-wayland waybar fastfetch hyprlock zsh aww

# 2. Make sure .config exists
mkdir -p ~/.config

# 3. Create symlinks (Force overwrite)
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/waybar ~/.config/waybar
ln -sf ~/dotfiles/rofi ~/.config/rofi
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc

echo "Install complete! Please restart your terminal or log out/in."
