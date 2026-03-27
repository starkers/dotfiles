# vi: ft=fish

if status is-interactive
    if command -s ggg >/dev/null
        ggg hook fish | source
    end
end
