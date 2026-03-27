if status is-interactive
    if command -s flux >/dev/null
        flux completion fish | source
    end
end
