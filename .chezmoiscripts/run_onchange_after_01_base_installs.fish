#!/bin/fish

function check_and_install
    if paru -v &>/dev/null
        echo "paru -S --needed" $argv
    else if brew -v &>/dev/null
        echo "brew install" $argv
    else if apt -v &>/dev/null
        echo "sudo apt install" $argv
    else
        echo "package manager not found"
        exit 1
    end
end

check_and_install \
    neovim \
    zoxide \
    lsd
