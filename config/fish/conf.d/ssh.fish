# vi: ft=fish

# names of common agents
set GCR_SVC gcr-ssh-agent
set GCR_PATH gcr/ssh

set SSH_SVC ssh-agent
set SSH_PATH ssh-agent.socket

# TODO sometimes its keyring/ssh  also... meh

if ! set -q XDG_RUNTIME_DIR
    set XDG_RUNTIME_DIR /run/user/(id -u)
end

function init_agent -a service path
    systemctl --user status $service 1>/dev/null 2>/dev/null
    echo systemctl --user status $service
    # 0 - its running
    # 3 - inactive/dead
    # 4 - not enabled/found/active
    switch $status
        case 0
            set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/$path
            # echo service $service is alive and now SSH_AUTH_SOCK=$SSH_AUTH_SOCK
            exit
        case 3
            echo service $service is dead jim..
        case '*'
            echo service $service is unknown status $0
    end

    # TODO: handle failure?
end

if set -q DESKTOP_SESSION
    switch $DESKTOP_SESSION
        case plasmax11
            init_agent $SSH_SVC $SSH_PATH
        case niri
            init_agent $GCR_SVC $GCR_PATH
        case '*'
            echo not sure what to do with DESKTOP_SESSION=$DESKTOP_SESSION
            echo please extend ~/.config/fish/conf.d/ssh.fish with your prefered agent
    end
end
