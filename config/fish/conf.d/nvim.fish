# vi: ft=fish


# https://www.reddit.com/r/fishshell/comments/jme5ks/how_do_i_set_editor_to_nvim_in_fish_shell/

if command -s nvim >/dev/null
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end
