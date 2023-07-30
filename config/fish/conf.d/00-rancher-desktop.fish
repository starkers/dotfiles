# vi: ft=fish
#
#

set NEWPATH $HOME/.rd/bin
if test -d $NEWPATH
    fish_add_path -a $NEWPATH
end

# I vendor my own kubectl "thanks"
if test -f $NEWPATH/kubectl
    rm $NEWPATH/kubectl
end
