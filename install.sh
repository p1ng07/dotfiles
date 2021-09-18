#! /bin/bash

mydir=`pwd`
myos=`cat /etc/*-release |awk -F "=" '/ID/ {print $2}' | head -n1 | tr '[:upper:]' '[:lower:]'`
myuser=`whoami`

# Install all of the programs to be used 
if [ "$myos" = "arch" ] 
then
    pacman -S --no-confirm git ttf-font-awesome awesome ttf-fira-code alacritty tmux nvim rofi man neofetch zsh python3 fzf nodejs bear ccls alsa-lib gtk3 libxss nss tff-font cups cmake fmt spdlog grpc ninja nlohmann-json papirus-icon-theme
    cd /opt
    git clone https://aur.archlinux.org/bear.git /opt/bear
    git clone https://aur.archlinux.org/brave-bin.git /opt/brave-bin
    git clone https://aur.archlinux.org/spaceship-prompt.git /opt/spaceship-prompt

    chown -R $myuser:users ./bear
    chown -R $myuser:users ./brave-bin
    chown -R $myuser:users ./spaceship-promp
    chsh -s /bin/zsh $myuser

elif [ "$myos" = "pop" ]
then 
    echo pop
fi

# position all of the files on the repo
mkdir $HOME/.config/alacritty &>> /dev/null
mkdir $HOME/.config &>> /dev/null

# Create all of the symbolic links for the files
ln -f .zshrc $HOME/
ln -f .tmux.conf $HOME/
tmux source-file $HOME/.tmux.conf

ln -f alacritty.yml ~/.config/alacritty/
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
git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh/plugins/

su $myuser
cd /opt
cd bear
makepkg -i
cd /opt

cd brave-bin
makepkg -i
cd /opt

cd spaceship-prompt
makepkg -i
cd /opt
