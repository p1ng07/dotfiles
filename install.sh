sudo xbps-install -Sy xbps
sudo xbps-install xorg stow rofi NetworkManager network-manager-applet firefox lightdm lightdm-gtk3-greeter emacs-gtk3  pipewire alacritty i3 neovim polybar lxappearance nitrogen zsh github-cli

stow .

# Non free repository
sudo xbps-install void-repo-nonfree

#Audio
sudo ln -s /etc/sv/pipewire /var/service

#Internet
sudo rm /var/service/dhcpcd
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/NetworkManager /var/service

sudo mkdir /etc/X11/xorg.conf.d
sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/

# shell
sudo chsh -s /bin/zsh francisco
# shell install prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1 zsh-plugins/
ln -sf "zsh_plugins/spaceship-prompt/spaceshipt.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
