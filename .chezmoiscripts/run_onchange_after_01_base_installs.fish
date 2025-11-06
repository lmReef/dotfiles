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
    lsd

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

set uv_tools \
    pywal \
    nextflow \
    nf-core
for tool in $uv_tools
    uv tool install $tool
end
