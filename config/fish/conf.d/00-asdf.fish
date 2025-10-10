# vi: ft=fish

fish_add_path -a ~/bin
set -gx ASDF_DATA_DIR ~/.asdf
set -gx PATH $PATH $ASDF_DATA_DIR/shims
