#! /usr/bin/zsh

# if this is a debian based distro, do magic for the spaceship prompt
if ! command apt &>> /dev/null; then
    fpath=($fpath "/home/fpp-dev/.zfunctions")
fi

# This is the z script
 . ~/dotfiles/z.sh >> ~/.zshrc

# So zsh has permisions on home directory
setopt auto_cd

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Vi-mode configuration
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export PATH="${PATH}:${HOME}/.local/bin/"


# Use hh to escape vi-mode
export KEYTIMEOUT=30
bindkey -M viins "uu" vi-cmd-mode

# Keybinds
bindkey -s '^v' '~/.local/bin/tmux-sessionizer.sh\n'
# aliases
alias ls='ls --color'
alias la='ls --color -a'
alias ll='ls --color -l'
alias lla='ls --color -la'
alias v="nvim"
alias dot="nvim ~/dotfiles/"
alias backlight="xbacklight -set"

# This is the spaceship prompt configuration
# Battery
SPACESHIP_BATTERY_SHOW=always
# Time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="#8700d7"
SPACESHIP_TIME_FORMAT=%T
# Directory
SPACESHIP_DIR_COLOR='#9999ff'
SPACESHIP_DIR_PREFIX=''
# Char
SPACESHIP_CHAR_SYMBOL='> '
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  battery       # Battery level and status
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)



# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Source my plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^f' autosuggest-accept
bindkey '^F' autosuggest-accept

alias luamake=/home/francisco/git/lua-language-server/3rd/luamake/luamake
