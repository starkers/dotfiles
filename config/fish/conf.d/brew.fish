# vi: ft=fish

if test -f /opt/homebrew/bin/brew
  eval (/opt/homebrew/bin/brew shellenv)
end


set BREW_JAVA /opt/homebrew/opt/openjdk@11/bin
if test -d $BREW_JAVA 
  fish_add_path $BREW_JAVA
end
