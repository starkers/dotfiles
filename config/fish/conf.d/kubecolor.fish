# vi: ft=fish

if status is-interactive
    if command -s kubecolor >/dev/null
        alias kubectl=kubecolor
    end
end
