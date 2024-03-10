if status is-interactive
    if command -s fnm >/dev/null
        set -gx FNM_LOGLEVEL quiet
        fnm env --use-on-cd --shell fish | source

        # add auto-complete
        fnm completions --shell fish | source

        # VSCode open integrated terminal does not trigger PWD hook
        if test "$TERM_PROGRAM" = vscode
            _fnm_autoload_hook
        end
        # suppress fnm telling me stuff, if I wanna know I'll use direnv to override this
    else
        echo '#WARN: fnm not installed'
    end
end
