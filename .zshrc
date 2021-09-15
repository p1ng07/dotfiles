#! /usr/bin/zsh

neofetch --os_arch off
# if this is a debian based distro, do magic for the spaceship prompt
if ! command apt > /dev/null; then
    fpath=($fpath "/home/fpp-dev/.zfunctions")
fi

# This is the z script
echo . ~/dotfiles/z.sh >> ~/.zshrc

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


# Use hh to escape vi-mode
export KEYTIMEOUT=10
bindkey -M viins "hh" vi-cmd-mode

# This is the spaceship prompt configuration
# Battery
SPACESHIP_BATTERY_SHOW=always
# Time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR="#8700d7"
SPACESHIP_TIME_FORMAT=' '%T
# Directory
SPACESHIP_DIR_COLOR='#ff5faf'
SPACESHIP_DIR_PREFIX=''
# Char
SPACESHIP_CHAR_SYMBOL='  '
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  venv          # virtualenv section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  exit_code     # Exit code section
  char          # Prompt character
)



# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship


#initialize Z (https://github.com/rupa/z) 
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
. /home/fpp-dev/dotfiles/z.sh
