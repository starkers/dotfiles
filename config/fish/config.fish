# vi: ft=fish


# # this section ensures the right side of the prompt stays clear
# function fish_right_prompt
#     #intentionally left blank
# end

# this disables the greeting/fortune by running an empty function
function fish_greeting
    # should u want to do something super exciting... try maybe:
    # fortune | cowsay -f tux
end

if status is-interactive

    if command -s starship-cfg >/dev/null
        starship-cfg
    else
        echo '#WARN: starship-cfg not installed'
    end

    if command -s starship >/dev/null
        function starship_transient_prompt_func
          starship module character
        end
        function starship_transient_rprompt_func
          starship module time
        end
        starship init fish | source
        enable_transience
    else
        echo '#WARN: starship not installed'
    end
end

if test -f $HOME/.aliases
    source $HOME/.aliases
end

if test -z "$XDG_DATA_HOME"
    set -Ux XDG_DATA_HOME $HOME/.local/share
end

set -Ux CHEATCOLORS true
set -Ux AWS_SDK_LOAD_CONFIG 1
set -Ux CHEATPATH /keybase/private/starkers/home/cheats
set -Ux TF_PLUGIN_CACHE_DIR $HOME/.tf_cache

# TODO: put in its own krew file
set -gx PATH $PATH $HOME/.krew/bin

fish_add_path -aP /sbin
