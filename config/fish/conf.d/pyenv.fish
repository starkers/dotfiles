# vi: ft=fish

if test -d $HOME/.pyenv

  # Add pyenv executable to PATH by running
  # the following interactively:

  set -Ux PYENV_ROOT $HOME/.pyenv
  set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

  # Load pyenv automatically by appending
  # the following to ~/.config/fish/config.fish:

  pyenv init - | source

end
