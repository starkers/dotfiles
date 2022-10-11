if command -s deno >/dev/null
    deno completions fish | source
else
    echo '#WARN: deno not installed'
end
