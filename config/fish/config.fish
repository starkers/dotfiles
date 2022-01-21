# vi: ft=fish


# this section ensures the right side of the prompt stays clear
function fish_right_prompt
 #intentionally left blank
end

# this disables the greeting/fortune by running an empty function
function fish_greeting
  # should u want to do something super exciting... try maybe:
  # fortune | cowsay -f tux
end

if status is-interactive
  if command -s starship > /dev/null
    starship init fish | source
  else
    echo '#WARN: starship not installed'
  end
end

if test -f $HOME/.aliases
  source $HOME/.aliases
end

fish_add_path -aP /sbin
