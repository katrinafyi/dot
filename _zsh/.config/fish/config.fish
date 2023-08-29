if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a -- zy 'sudo zypper'
    abbr -a -- vim nvim
    abbr -a -- g git
    bind \b backward-kill-path-component
    bind \e\[3\;5\~ kill-word
end
