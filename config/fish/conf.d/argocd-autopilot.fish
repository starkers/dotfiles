
set CMD argocd-autopilot

if status is-interactive
    if command -s $CMD >/dev/null
        $CMD completion fish | source
    else
        echo "#WARN: $CMD not installed"
    end
end
