# vi: ft=fish

# interactive terminal?
if status is-interactive
    # go is installed?
    if command -s go >/dev/null
        # GOPATH isn't already defined?
        if test -z "$GOPATH"
            set GOPATH (go env | grep ^"GOPATH" | cut -d "=" -f 2 | sed 's+"++g')

        end
        # ensure that GOPATH/bin is in PATH
        fish_add_path -a $GOPATH/bin
        # also set GOROOT
        if test -z "$GOROOT"
            set GOROOT (go env | grep ^"GOROOT" | cut -d "=" -f 2 | sed 's+"++g')
        end
    end
end
