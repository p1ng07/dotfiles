# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

source ~/.local/scripts/git-prompt.sh 

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias ..="cd .."

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;214m\]\w\[\e[0m\] \[\e[38;5;75;1m\]\u\[\e[0m\] in\[\e[38;5;87;1m\]${PS1_CMD1}\n\[\e[96m\]➔ \[\e[0m\]'
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/francisco/.sdkman"
[[ -s "/home/francisco/.sdkman/bin/sdkman-init.sh" ]] && source "/home/francisco/.sdkman/bin/sdkman-init.sh"
