if status is-interactive
    set -a PATH \
        ~/.local/bin \
        ~/.local/bin/scripts \
        ~/.dotfiles/scripts \
        ~/.cargo/bin

    set -x EDITOR nvim

    # set up tools
    if test -d /home/linuxbrew/
        /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source
        for i in /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d/*
            source $i
        end
    end
    mise activate fish | source
    zoxide init fish | source
    fzf --fish | source
    atuin init fish --disable-up-arrow | source

    # completions
    mise completion fish | source
    chezmoi completion fish | source
end
