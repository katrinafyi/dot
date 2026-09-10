if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -q zypper
        abbr -a -- zy 'sudo zypper'
    end
    if command -q nvim
        abbr -a -- vim nvim
    end
    abbr -a -- gg jj
    abbr -a -- j j
    abbr -a -- p pueue
    abbr -a -- g git
    # abbr -a -- cd pushd
    abbr -a -- - popd
    abbr -a -- d 'doom-emacs'

    abbr -a -- ll 'ls -l'

    bind \b backward-kill-path-component
    bind \e\[3\;5\~ kill-word
    bind \cZ echo fg

    _tide_detect_os | read -g --line os_branding_icon os_branding_color os_branding_bg_color
    set -U tide_os_bg_color normal
    set -U tide_os_color white
    set -U tide_os_icon $os_branding_icon

    if command -v ruby &>/dev/null && command -v gem &>/dev/null
        fish_add_path "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
    end
    for p in ~/.ghcup/bin ~/progs/mx
        if [ -d $p ]
            fish_add_path $p
        end
    end

    if [ -x ~/.cargo/bin/cargo-mommy ]
        abbr -a -- cargo 'cargo mommy'
    end

    if [ -f /run/.toolboxenv ]
        if ! [ -d /nix/store ] && [ -d ~/.local/share/nix/root/nix ]
            sudo mkdir -p /nix
            sudo mount --bind ~/.local/share/nix/root/nix /nix
        end

        if ! [ -d /run/host/nix/store ] && [ -d /run/host/var/home/rina/.local/share/nix/root/nix ]
           echo 'Host /nix needs to be mounted!'
           flatpak-spawn --host pkexec bash -x -c '
LIBMOUNT_FORCE_MOUNT2=always unshare --mount /usr/bin/bash -x -c "mount -o remount,rw / ; mkdir -p /nix"
umount -q /nix
mount --bind --read-only /var/home/rina/.local/share/nix/root/nix /nix'
        end
    end
end

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/rina/.local/share/coursier/bin"
# <<< coursier install directory <<<

if command -v direnv &>/dev/null
    direnv hook fish | source
end

if command -v opam &>/dev/null
    eval (opam env)
end

export CARGO_MOMMYS_MOODS="chill/ominous/thirsty/yikes"

fish_add_path ~/.config/emacs/bin

for ed in vim nvim doom-emacs;
    if command -v $ed &>/dev/null
        export VISUAL="$ed"
        export EDITOR="$ed"
    end
end
