
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

# Prompt
PROMPT='%~ $ '

#vim mode
bindkey -v
# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
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

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[5 q'
}
#aliases
alias v='nvim'
alias vim='nvim'
source /home/francisco/dotfiles/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
