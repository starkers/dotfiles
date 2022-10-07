# vi: ft=fish


if command -s fnm > /dev/null

  fnm env --use-on-cd | source

# VSCode open integrated terminal does not trigger PWD hook
  if test "$TERM_PROGRAM" = "vscode"
    _fnm_autoload_hook
  end
else
  echo '#WARN: fnm not installed'
end
