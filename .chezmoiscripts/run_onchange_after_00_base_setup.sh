#!/bin/bash

function check_and_install() {
    if pacman -v &>/dev/null; then
        echo "sudo pacman -S --needed base-devel" "$@"

        # paru
        git clone https://aur.archlinux.org/paru.git ~/.cache/paru
        cd ~/.cache/paru
        makepkg -si
    elif apt -v &>/dev/null; then
        # brew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "sudo apt update; sudo apt upgrade"
        echo "sudo apt install" "$@"
    else
        echo "distro package manager not configured"
        exit 1
    fi
}

check_and_install \
    git \
    fish
