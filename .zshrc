# ==========================================
# PATH
# ==========================================
export PATH="$HOME/.local/bin:$PATH"

# ==========================================
# OH MY ZSH
# ==========================================
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  sudo
  archlinux
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# ==========================================
# COMPLETION SYSTEM
# ==========================================
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.zsh/cache

setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# ==========================================
# CORRECTION / SMART BEHAVIOR
# ==========================================
setopt CORRECT
setopt CORRECT_ALL
setopt AUTO_CD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ==========================================
# PLUGINS (manual)
# ==========================================
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

autoload -U colors && colors

# ==========================================
# ALIASES
# ==========================================
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias reload='source ~/.zshrc'

# Config shortcuts
alias zsh.conf='nano ~/.zshrc'
alias hypr.conf='nano ~/.config/hypr/hyprland.conf'
alias waybar.conf='nano ~/.config/waybar/config'
alias rofi.conf='nano ~/.config/rofi/config.rasi'

# ==========================================
# RANGER FUNCTION
# ==========================================
r() {
  tmp="$(mktemp)"
  ranger --choosedir="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    cd "$dir"
  fi
}

# ==========================================
# CTRL + L → CLEAR + FASTFETCH
# ==========================================
function fastclear() {
  clear
  fastfetch
  zle reset-prompt
}

zle -N fastclear
bindkey '^L' fastclear

# ==========================================
# PROMPT
# ==========================================
PROMPT='%F{208}[%n@%m %1~]$ %f'

# ==========================================
# STARTUP
# ==========================================
fastfetch
alias dots-sync='cd ~/dotfiles && git add . && git commit -m "Quick sync" && git push'
