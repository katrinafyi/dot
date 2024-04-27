if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -- zy 'sudo zypper'
    abbr -a -- vim nvim
    abbr -a -- g git
    abbr -a -- cd pushd
    abbr -a -- - popd

    bind \b backward-kill-path-component
    bind \e\[3\;5\~ kill-word
    bind \cZ echo fg

    _tide_detect_os | read -g --line os_branding_icon os_branding_color os_branding_bg_color
    set -U tide_os_bg_color normal
    set -U tide_os_color white
    set -U tide_os_icon $os_branding_icon

    if which ruby >/dev/null && which gem >/dev/null
        fish_add_path "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
    end
    for p in ~/.ghcup/bin ~/progs/mx
        if [ -d $p ]
            fish_add_path $p
        end
    end
end
