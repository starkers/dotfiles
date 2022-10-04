# vi: ft=fish

if test -d $HOME/.cargo/bin
    fish_add_path -a $HOME/.cargo/bin
end

# set -gx CARGO_ROOT $HOME/.cargo
# set -gx PATH $CARGO_ROOT/bin $PATH
