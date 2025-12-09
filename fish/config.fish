if status is-interactive
    set -a PATH \
        ~/.local/bin \
        ~/.local/bin/scripts \
        ~/.cargo/bin \
        ~/.atuin/bin

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

    # hydro config
    set -g hydro_fetch true
    set -g hydro_multiline true
    set -g fish_prompt_pwd_dir_length 20
    set -g hydro_color_pwd $fish_color_cwd
    set -g hydro_color_git $fish_color_param
    set -g hydro_color_start $fish_color_command
    set -g hydro_color_error $fish_color_error
    set -g hydro_color_prompt $fish_color_cwd
    set -g hydro_color_duration $fish_color_autosuggestion
end
