{ config, pkgs, ... }:

let
  # TODO: can these be installed declaratively?
  # nix-channel --add nixgl https://github.com/guibou/nixGL/archive/main.tar.gz  nixgl
  # nix-channel --add unstable https://nixos.org/channels/nixpkgs-unstable       unstable
  nixgl = import <nixgl> { };
in

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "starkers";
  home.homeDirectory = "/home/starkers";
  xdg.dataHome = "/home/starkers/.local/share/";

  # ## TODO: might wanna test this
  # home-manager.useGlobalPkgs = true;

  home.packages = [

    nixgl.auto.nixGLDefault
    pkgs.fortune
    pkgs.cowsay
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
      ];
    })
  ];



  # environment.systemPackages = with pkgs; [
  #   this_pkg
  #   that_pkg
  #   some_other_pkg
  #   (wrapOBS {
  #     plugins = with obs-studio-plugins; [
  #       obs-backgroundremoval
  #     ];
  #   })
  # ];


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
