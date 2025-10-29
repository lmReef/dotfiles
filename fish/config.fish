if status is-interactive
    set -a PATH \
        ~/.local/bin \
        ~/.local/bin/scripts \
        ~/.dotfiles/scripts \
        ~/.cargo/bin

    set -x EDITOR nvim

    # set up tools
    test -d /home/linuxbrew/ && /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
    mise activate fish | source
    zoxide init fish --cmd cd | source
    fzf --fish | source
    atuin init fish --disable-up-arrow | source

    # completions
    mise completion fish | source
    chezmoi completion fish | source
end
