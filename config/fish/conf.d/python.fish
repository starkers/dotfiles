# vi: ft=fish


# default "local" python path on linux


if test -d $HOME/.local/bin
    fish_add_path -a $HOME/.local/bin
end
