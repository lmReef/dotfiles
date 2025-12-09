#!/bin/bash

function check_and_install() {
    if which pacman &>/dev/null; then
        sudo pacman -S --needed base-devel "$@"

        # paru
        if ! which paru &>/dev/null; then
            git clone https://aur.archlinux.org/paru.git ~/.cache/paru
            cd ~/.cache/paru
            makepkg -si
        fi
    elif which apt &>/dev/null; then
        # brew
        if ! which brew &>/dev/null; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi

        sudo apt update
        sudo apt upgrade
        sudo apt install "$@"
    else
        echo "distro package manager not configured"
        exit 1
    fi
}

check_and_install \
    fish
