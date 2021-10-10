#! /bin/bash

mydir=`pwd`
myos=`cat /etc/*-release |awk -F "=" '/ID/ {print $2}' | head -n1 | tr '[:upper:]' '[:lower:]'`
myuser=`whoami`

# Install all of the programs to be used 
if [ "$myos" = "arch" ] 
then
    pacman -S --noconfirm git ttf-font-awesome awesome ttf-fira-code alacritty tmux neovim rofi man neofetch zsh python3 fzf nodejs ccls alsa-lib gtk3 libxss nss ttf-font cups cmake fmt spdlog grpc ninja nlohmann-json papirus-icon-theme yarn
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

ln -f alacritty.yml ~/.config/alacritty/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf nvim $HOME/.config/nvim

# Move the wallpapers
mkdir /usr/share/backgrounds &>> /dev/null
chmod 777 /usr/share/backgrounds/
cp $mydir/wallpapers/* /usr/share/backgrounds/

# Git clone the zsh plugins  
if [ ! -d "/usr/share/zsh/plugins" ] && echo "Plugin directory created"
then
    mkdir /usr/share/zsh/plugins
fi

chmod 777 /usr/share/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting /usr/share/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions

cd /opt
git clone https://aur.archlinux.org/brave-bin.git
git clone https://aur.archlinux.org/bear.git
git clone https://aur.archlinux.org/spaceship-prompt.git
