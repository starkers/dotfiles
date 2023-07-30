# vi: ft=fish
#
#

if test -n DESKTOP_SESSION
    if test $DESKTOP_SESSION = i3
        set (gnome-keyring-daemon --start 2>/dev/null| string split "=")
    end
end
