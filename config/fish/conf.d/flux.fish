if status is-interactive
  if command -s flux >/dev/null
    flux completion fish | source
  else
      echo '#WARN: flux not installed; try "asdf plugin-add flux2 && asdf install flux2 0.41.2"'
  end
end
