#!/bin/bash

echo "Setting up user directories"
mkdir $HOME/{downloads,documents,desktop,video,music,pictures}

echo "Configuring git"
git config --global user.name man3kin3ko
git config --global user.email perevoznikovaks@gmail.com

echo "Checking priviledges"
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
