# vi: ft=sh


# this section ensures the right side of the prompt stays clear
function fish_right_prompt
 #intentionally left blank
end


function fish_greeting
  # fortune | cowsay -f tux
end



if command -s starship > /dev/null
  starship init fish | source
else
  echo 'WARN: starship not installed'
end

if test -f ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end


# Dunno why.. by /sbin isn't part of my PATH on fedora 34
set -x PATH /sbin/ $PATH
