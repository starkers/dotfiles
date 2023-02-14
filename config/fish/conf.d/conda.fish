# vi: ft=fish
#
#

if command -s conda > /dev/null
  eval conda "shell.fish" "hook" $argv | source
end


