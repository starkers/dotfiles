# vi: ft=fish
#
#

# is $DESKTOP_SESSION set?
if set -q DESKTOP_SESSION
    if [ $DESKTOP_SESSION = i3 ]
        echo "# DESKTOP_SESSION == i3"
        set (gnome-keyring-daemon --start 2>/dev/null| string split "=")
        # else
        #     echo "# DESKTOP_SESSION != i3"
    end
    # else
    #     echo "# DESKTOP_SESSION is not set"
end
