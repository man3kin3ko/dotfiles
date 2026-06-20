#!/bin/bash

echo "Setting up user directories" # TODO: skel
mkdir $HOME/{downloads,documents,desktop,video,music,pictures}

echo "Configuring git"
git config --global user.name man3kin3ko
git config --global user.email perevoznikovaks@gmail.com
git config --global --add safe.directory '/usr/share/*'

# echo "Instaling theme"
# if [ ! -d "~/.themes/Orchis-Purple" ]; then
# 	cd /tmp && git clone https://github.com/vinceliuice/orchis-theme cd orchis-theme && ./install.sh -t purple
# fi

echo "Elevating priviledges"
if [ "$EUID" -ne 0 ]; then
	exec sudo "$0" "$@"
fi

echo "Setting up NetworkManager"
if ! systemctl is-enabled --quiet NetworkManager.service; then
	systemctl enable NetworkManager.service
fi

if ! systemctl is-active NetworkManager.service; then
	systemctl start NetworkManager.service
fi

echo "Sorting mirrorlist"
rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist

echo "Installing AUR pacakages"
yay -S xfce-polkit google-chrome vscodium-bin oh-my-zsh-git zsh-theme-powerlevel10k

echo "Setting up openbox"
mkdir -p /usr/share/openbox/icons && cd /usr/share/openbox/icons
# git clone --no-checkout --filter=blob:none  https://github.com/archcraft-os/archcraft-openbox/
# cd archcraft-openbox
# git sparse-checkout init --cone
# git sparse-checkout set files/icons/you
# git checkout