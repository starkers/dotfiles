# vi: ft=fish

# misc scripts in my dotfiles
set D $HOME/.bin
if test -d $D
    fish_add_path -a $D
end

## where I store misc stuff sometimes
# fnm
# topgrade
# ggg
set D $HOME/.software/bin
if test -d $D
    fish_add_path -a $D
end

# erase "D"
set -e D
