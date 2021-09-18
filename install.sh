#! /bin/bash

mydir=`pwd`
myos=`cat /etc/*-release |awk -F "=" '/ID/ {print $2}' | head -n1 | tr '[:upper:]' '[:lower:]'`
myuser=`whoami`

# Install all of the programs to be used 
if [ "$myos" = "arch" ] 
then
    pacman -S --no-confirm git ttf-font-awesome awesome ttf-fira-code alacritty tmux nvim rofi man neofetch zsh

    chsh -s /bin/zsh $myuser

    if ! command -v yay > /dev/null
    then
        echo You need to install yay first
        break 9999
    fi

elif [ "$myos" = "pop" ]
then 
    echo pop
fi

# position all of the files on the repo
mkdir $HOME/.config/alacritty &>> /dev/null
mkdir $HOME/.config &>> /dev/null

# Create all of the symbolic links for the files
ln -f .zshrc ~/
ln -f .tmux.conf ~/

ln -f alacrity.yml ~/.config/alacritty/
ln -sf $mydir/nvim $HOME/.config/nvim

# Move the wallpapers
chmod 777 /usr/share/backgrounds/
cp $mydir/wallpapers/* /usr/share/backgrounds/

# Git clone the zsh plugins  
if [ ! -d "/usr/share/zsh/plugins" ] && echo "Plugin directory created"
then
    mkdir /usr/share/zsh/plugins
fi

chmod 777 /usr/share/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh/plugins

