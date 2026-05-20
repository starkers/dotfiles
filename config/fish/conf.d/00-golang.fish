# vi: ft=fish

# if test -s $HOME/.g/env.fish
#     source $HOME/.g/env.fish
# end

# interactive terminal?
if status is-interactive
    # go is installed?
    if command -s go >/dev/null
        set --export --universal GOROOT (go env GOROOT)
        set --export --universal GOPATH (go env GOPATH)
        set --export --universal GOBIN (go env GOPATH)/bin
        set --export --universal PATH $PATH $GOBIN $GOROOT/bin
        # GOPATH isn't already defined?
        # if test -z "$GOPATH"
        #     # set GOPATH from `go env`
        #     set GOPATH (go env | grep ^"GOPATH" | cut -d "=" -f 2 | sed 's+"++g')
        # end
        # # ensure that GOPATH/bin is in PATH
        fish_add_path -a $GOPATH/bin
        # set -x PATH $PATH GOPATH/bin
        # # also set GOROOT
        # if test -z "$GOROOT"
        #     set GOROOT (go env | grep ^"GOROOT" | cut -d "=" -f 2 | sed 's+"++g')
        # end
    else
        echo "no go?"
    end
end
