# vi: ft=fish
#
#

set GCR_SVC gcr-ssh-agent.socket
set GNOME_KEYRING_SVC gnome-keyring-daemon.socket
# is $DESKTOP_SESSION set?
if set -q DESKTOP_SESSION
    # is it i3?
    if [ $DESKTOP_SESSION = i3 ]
        # check if its GCR or gnome-keyring-daemon
        systemctl --user status $GCR_SVC 1>/dev/null 2>/dev/null
        # 0 - its running
        # 3 - inactive/dead
        # 4 - not enabled/found/active
        if test $status -eq 0
            set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh
        else
            systemctl --user status $GNOME_KEYRING_SVC 1>/dev/null 2>/dev/null
            if test $status -eq 0
                set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh
            end
        end
    end
end
