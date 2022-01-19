zmodload zsh/zprof

# export TERM="xterm-256color"
HIST_STAMPS="yyyy-mm-dd"
unsetopt share_history

export EDITOR=vim
export LS_COLORS

function my_load_ggg(){
  if [[ -o interactive ]]; then
    if hash ggg 2>/dev/null; then
      eval "$(ggg hook zsh)"
    else
      echo 'WARN: "ggg" binary not found in your PATH'
    fi
  fi
}

function my_load_profile(){
  source ~/.profile
}

function my_load_aliases(){
  source ~/.aliases
}

function my_load_shell_functions(){
  if [ -e ${HOME}/.shell_functions ] ; then 
    source ~/.shell_functions
  fi
}

function my_load_z_and_fzf(){
  # https://github.com/junegunn/fzf/wiki/examples#z

  unalias z
  z() {
    if [[ -z "$*" ]]; then
      cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
    else
      _last_z_args="$@"
      _z "$@"
    fi
  }

  zz() {
    cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
  }
  z_last() {
    cd "$(_z 2>&1 | tail -1 | sed 's/^[0-9,.]* *//')"
  }
}

function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

function my_nvm_load(){

  if [ -e ${HOME}/.nvm/nvm.sh ]; then

    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    # place this after nvm initialization!
    autoload -U add-zsh-hook
    load-nvmrc() {
      local node_version="$(nvm version)"
      local nvmrc_path="$(nvm_find_nvmrc)"

      if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
          nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
          nvm use
        fi
      elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
      fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
  fi

}

function my_load_direnv(){
  if [[ -o interactive ]] ; then
    hash direnv 2>/dev/null && eval "$(direnv hook zsh)"
  fi
}

function my_load_fzf(){
  if [[ -o interactive ]] ; then
    source ~/.fzf/shell/completion.zsh
    source ~/.fzf/shell/key-bindings.zsh
  fi
}

function my_load_sdkman(){
  if [[ -o interactive ]] ; then
    if [ -e ${HOME}/.sdkman/bin/sdkman-init.sh ] ; then
      source "$HOME/.sdkman/bin/sdkman-init.sh"
    fi
  fi
}

function my_load_vte(){
  if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    [ -e /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh
  fi
}

function my_load_keybase_stuff(){
  KB_USER=starkers
  KB_PLACE=/keybase/private/${KB_USER}/home/shell
  if [ -d ${KB_PLACE} ]; then
    source ${KB_PLACE}/*-profile.sh
  fi
  export PATH=/keybase/private/${KB_USER}/scripts:${PATH}
  export CHEATPATH="/keybase/private/${KB_USER}/home/cheats"
}



function my_load_starship(){
  if hash starship 2>/dev/null; then
    eval "$(starship init zsh)"
  fi
}

  

if [[ -o interactive ]]; then

  zle -N fancy-ctrl-z
  bindkey '^Z' fancy-ctrl-z
  zstyle ":completion:*:commands" rehash 1
  bindkey '^W' vi-backward-kill-word


fi



if [[ -o interactive ]]; then
  my_load_starship
  my_load_aliases
  my_load_fzf
  my_load_keybase_stuff
  my_load_profile
  my_load_shell_functions
  my_load_vte
  # my_load_z_and_fzf
  my_load_ggg
fi

# # TODO: why isn't this being set?
# export SHELL=/usr/bin/zsh

export PATH="${GOPATH}/bin:${PATH}"
export PATH="${HOME}/.bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.software/bin:${PATH}"
# export PATH="${HOME}/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:${PATH}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export KUBECONFIG="${HOME}/.kube/config"

my_load_direnv


hash jenv 2>/dev/null
rc=$?
if [  ${rc} -eq 0 ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# hash fnm 2>/dev/null && eval `fnm env`


# # User configuration
# # Always work in a tmux session if tmux is installed
# # https://github.com/chrishunt/dot-files/blob/master/.zshrc
# if [[ -o interactive ]] ; then
#   if which tmux 2>&1 >/dev/null; then
#     if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
#       NOW="$(date +%Y-%m-%d_%H%M%S)"
#       tmux new -t hack-$NOW
#     fi
#   fi
# fi
