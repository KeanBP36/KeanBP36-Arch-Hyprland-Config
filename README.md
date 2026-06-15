# Screenshots

![Fastfetch](fastfetch.xcf)
![Hyprland Config](hyprland-config-full.jpg)
![Rofi Launcher](rofi.png)
![Tiling Layout](tiling.jpg)

- **Hyprland**:
- **Waybar**: 
- **Rofi**: 
- **Kitty**: 
- **Fastfetch**: 
- **Shell**: 
- **hyplock**:
- **awww**:


```bash
git clone https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git ~/dotfiles && cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

If u have configs u want to replace
```bash
rm -rf ~/.config/hypr ~/.config/waybar ~/.config/rofi ~/.config/fastfetch ~/.zshrc ~/.bashrc && \
rm -rf ~/dotfiles && \
git clone https://github.com/KeanBP36/KeanBP36-Arch-Hyprland-Config.git ~/dotfiles && \
cd ~/dotfiles && \
chmod +x install.sh && \
./install.sh
```
to update to the new configs just run 
```bash
update-dots
```
to reinstalall all the pakages needed for this
```bash
cd ~/dotfiles && git pull && ./install.sh
