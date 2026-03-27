# vi: ft=fish

# # fish_add_path -a ~/bin
# set -gx ASDF_DATA_DIR ~/.asdf
# set -gx PATH $PATH $ASDF_DATA_DIR/shims

if command -s asdf >/dev/null

    # ASDF configuration code
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    # Do not use fish_add_path (added in Fish 3.2) because it
    # potentially changes the order of items in PATH
    if not contains $_asdf_shims $PATH
        set -gx --prepend PATH $_asdf_shims
    end
    set --erase _asdf_shims
else
    echo 'no asdf'
end
