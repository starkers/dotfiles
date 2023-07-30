# vi: ft=fish


if command -s zoxide >/dev/null
    zoxide init fish | source
else
    echo '#WARN: zoxide not installed'
end
