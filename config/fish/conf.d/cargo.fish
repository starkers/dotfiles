# vi: ft=fish

if test -d $HOME/.cargo/
    set -gx CARGO_ROOT $HOME/.cargo
    set -gx PATH $CARGO_ROOT/bin $PATH
end
