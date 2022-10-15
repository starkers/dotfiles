
# Nix
if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'

    if test -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
        if command -s babelfish >/dev/null
            cat $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh | babelfish | source
        else
            echo #WARN: please install babelfish
            echo "eg: \$ go install bou.ke/babelfish@latest"
        end
        # # home manager wants this apparantly
        # # https://github.com/NixOS/nixpkgs/issues/149791
        # set NIX_PATH $HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels
    end
    # End Nix

end
