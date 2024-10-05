
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/francisco/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

. ~/dotfiles/zsh_plugins/z.sh

# Magic for vterm to work
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[5 q'
}
#aliases
alias unfuck_wifi='sudo sv down NetworkManager && sudo sv up NetworkManager'
alias v='nvim'
alias vim='nvim'
alias ls='ls --color'
alias la='ls -a'
alias lla='ls -la'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Update PATH
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export LD_LIBRARY_PATH="/usr/local/lib/"

autoload -U promptinit; promptinit

source "$HOME/.zsh/spaceship/spaceship.zsh"

# User
SPACESHIP_USER_SHOW='always'
SPACESHIP_USER_COLOR='#80a8fd'

SPACESHIP_CHAR_SYMBOL='π '
SPACESHIP_CHAR_COLOR_SUCCESS='#82aaff'

SPACESHIP_VENV_PREFIX='🐍 '
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  venv          # virtual environment for python
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)
cd ~

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
