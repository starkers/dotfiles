# This doesn't seem to agree with OSX

if test (uname) = Linux
    function fish_user_key_bindings
        fzf_key_bindings
    end
end
