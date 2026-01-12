#!/bin/fish

function check_and_install
    if which paru &>/dev/null
        paru -S --needed $argv
    else if which brew &>/dev/null
        brew install $argv
    else if which apt &>/dev/null
        sudo apt install $argv
    else
        echo "package manager not found"
        exit 1
    end
end

check_and_install \
    neovim \
    mise \
    zoxide \
    lsd \
    awww

if which paru &>/dev/null
    check_and_install \
        swaync
else if which apt &>/dev/null
    sudo apt install sway-notification-center
end

mise use -g \
    watchexec \
    chezmoi \
    lua \
    lua@5.4 \
    python \
    uv \
    node \
    npm \
    prettier

set python_tools \
    pywal
if string match work (hostnamectl hostname) &>/dev/null
    set -a python_tools \
        nextflow \
        nf-core \
        jupyterlab \
        jupytext \
        nbdime
end
for tool in $uv_tools
    uv tool install $tool
end

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
