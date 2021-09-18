#! /bin/bash 
# Install the rest of the dependencies with makepkg
myuser=`whoam`
mydir=`pwd`

su 
cd /opt
git clone https://aur.archlinux.org/bear.git
git clone https://aur.archlinux.org/brave-bin.git
git clone https://aur.archlinux.org/spaceship-prompt.git

chown -R $myuser:users ./bear
chown -R $myuser:users ./brave-bin
chown -R $myuser:users ./spaceship-promp

su $myuser
cd bear
makepkg -i
cd mydir

cd brave-bin
makepkg -i
cd mydir

cd spaceship-prompt
makepkg -i
cd mydir
