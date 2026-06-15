#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
fastfetch
fastclear() {
  clear
  fastfetch
}

bind -x '"\C-l": fastclear'
export PATH="$HOME/.local/bin:$PATH"


# Hyprland
alias hyprland.conf='nano ~/.config/hypr/hyprland.conf'

# Waybar
alias waybar.conf='nano ~/.config/waybar/config'
alias waybar.style='nano ~/.config/waybar/style.css'

# Rofi
alias rofi.conf='nano ~/.config/rofi/config.rasi'

# Fastfetch
alias fastfetch.conf='nano ~/.config/fastfetch/config.jsonc'

# Zsh
alias zsh.conf='nano ~/.zshrc'

# Bash
alias bash.conf='nano ~/.bashrc'

# Kitty
alias kitty.conf='nano ~/.config/kitty/kitty.conf'

# Alacritty
alias alacritty.conf='nano ~/.config/alacritty/alacritty.toml'

# Neovim
alias nvim.conf='nano ~/.config/nvim/init.lua'

# Hyprpaper
alias hyprpaper.conf='nano ~/.config/hypr/hyprpaper.conf'

# Hyprlock
alias hyprlock.conf='nano ~/.config/hypr/hyprlock.conf'

# Mako
alias mako.conf='nano ~/.config/mako/config'

# Dunst
alias dunst.conf='nano ~/.config/dunst/dunstrc'

# Foot terminal
alias foot.conf='nano ~/.config/foot/foot.ini'


alias clean="sudo pacman -Sc && flatpak uninstall --unused && sudo journalctl --vacuum-size=100M"
alias updatedots='cd ~/dotfiles && git add . && git commit -m "Update: $(date)" && git push'
