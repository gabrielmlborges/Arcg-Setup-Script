#!/bin/bash
# ------------------------- VARIABLES ------------------------- #
PACKAGES_TO_INSTALL=(
	firefox
	vlc
	qbittorrent
	neovim
	git
	ttf-hack-nerd
)
# ------------------------- TEST ------------------------- #
# Do I have access to the internet?
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
	echo "[ERROR] - NO INTERNET"
	exit 1
else
	echo "[INFO] INTERNET OK"
fi
# ------------------------- FUNCTIONS ------------------------- #
att_upgrade_repositories () {
	sudo pacman -Syu
}

install_pacman_packages () {
	for program in ${PACKAGES_TO_INSTALL[@]}; do
		if ! pacman -Q | grep -q $program; then
			sudo pacman -S $program
		else
			echo "[INFO] - PACKAGE $program IS ALREADY INSTALLED"
		fi
	done
}
# ------------------------- EXECUTION ------------------------- #
att_upgrade_repositories
install_pacman_packages
