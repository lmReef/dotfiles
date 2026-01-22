#!/bin/fish

function check_and_install
    if which paru &>/dev/null
        paru -S --needed $argv
    else if which brew &>/dev/null
        brew install -q $argv
    else if which apt &>/dev/null
        sudo apt install -yqq $argv
    else
        echo "package manager not found"
        exit 1
    end
end

set -l build_dir ~/builds
mkdir -p $build_dir

check_and_install \
    neovim \
    mise \
    zoxide \
    lsd \
    thunar

if which paru &>/dev/null
    paru -S --needed \
        swaync \
        awww
else if test -e /usr/bin/apt
    sudo apt install -yqq \
        sway-notification-center \
        thunar

    if not which awww &>/dev/null
        git clone https://codeberg.org/LGFae/awww $build_dir/
        pushd $build_dir/awww

        cargo build --release
        ln -s ~/builds/awww/target/release/awww ~/.local/bin/
        ln -s ~/builds/awww/target/release/awww-daemon ~/.local/bin/

        popd
    end
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
