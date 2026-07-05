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
#alias gpush='cd ~/dotfiles && git add . && git commit -m "Update: $(date)" && git push'
#alias gpull='cd ~/dotfiles && git pull'
alias update-dots='~/dotfiles/update.sh'
alias dot="codium ~/dotfiles"
# Add these to your shell config file
alias gpull='git pull origin main'
alias gpush='git add . && git commit -m "Auto-sync: $(date)" && git push origin main'
alias sleep='systemctl suspend'
#alias virus-scan='sudo clamscan -r -i --max-filesize=50M --max-scansize=50M --exclude-dir="^/sys|^/proc|^/dev|^/\.snapshots|^/mnt|^/var/log|^/var/cache"'
alias home-scan='clamscan -r -i --max-filesize=100M --max-scansize=100M ~'
#alias virus-scan='sudo clamdscan --multiscan --fdpass'
alias virus-scan='sudo clamdscan --multiscan --fdpass /'

