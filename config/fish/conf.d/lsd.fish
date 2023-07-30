if status is-interactive
    if command -s lsd >/dev/null
        alias ll="lsd -l"
        alias lla="lsd -la"
        alias ls="lsd"
        alias ltr="lsd -ltr"
        deno completions fish | source
    else
        echo '#WARN: lsd not installed'
    end
end
