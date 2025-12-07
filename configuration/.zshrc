# ====================================================
#  QUANTUM ARCH - ZSH CONFIGURATION (Developer Edition)
# ====================================================

# --- 1. INISIALISASI DASAR ---
# Mengaktifkan warna
autoload -U colors && colors
# Mengaktifkan auto-completion canggih
autoload -Uz compinit
compinit
# Opsi navigasi pintar
setopt autocd              # Pindah folder tanpa ketik cd
setopt interactive_comments # Boleh pakai # di terminal

# --- 2. HISTORY SETTINGS ---
# Agar command tidak hilang saat tutup terminal
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory       # Append, jangan timpa
setopt sharehistory        # Share history antar tab terminal
setopt hist_ignore_dups    # Jangan simpan command duplikat

# --- 3. QUANTUM PROMPT (TAMPILAN) ---
# Format: [User@Hostname Folder] $
# Warna: User(Cyan), Host(Ungu), Folder(Kuning)
PROMPT="%B%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[magenta]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%b$ "

# Prompt sebelah kanan (Jam) - Opsional, terlihat pro
RPROMPT="%{$fg[blue]%}[%t]%{$reset_color%}"

# --- 4. KEYBINDINGS (FIX TOMBOL) ---
# Agar tombol Home, End, Delete berfungsi normal
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# --- 5. ALIASES (SHORTCUT DEVELOPER) ---
# System
alias c='clear'
alias q='exit'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'

# List Files (Lebih berwarna)
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'  # List detail
alias la='ls -a --color=auto'   # List hidden
alias l='ls -CF --color=auto'

# Developer Tools
alias vi='nvim'
alias vim='nvim'
alias py='python'
alias g='git'
alias d='docker'
alias dc='docker-compose'

# Aplikasi GUI (Fix Sandbox)
alias code='code --no-sandbox' 

# Safety (Tanya dulu sebelum hapus/timpa)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# --- 6. ENVIRONMENT VARIABLES ---
export EDITOR='nvim'
export VISUAL='nvim'
export TERM='xterm-kitty'
export PATH=$HOME/bin:/usr/local/bin:$PATH

# --- 7. WELCOME MESSAGE ---
# Tampilkan logo kecil atau info saat buka terminal
echo -e "\e[1;36mQuantumArch Developer Console\e[0m"
echo -e "Kernel: $(uname -r) | Shell: ZSH"
