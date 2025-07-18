{ config, pkgs, ... }:

{
  home.username = "jamesa";
  home.homeDirectory = "/home/jamesa";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home-modules/cli.nix
    ../../home-modules/desktop-utility.nix
    ../../home-modules/redshift.nix
    ../../home-modules/games.nix
    ../../home-modules/shell.nix
    ../../home-modules/terminal.nix
    ../../home-modules/version-control.nix
    ../../home-modules/neovim/neovim.nix
    ../../home-modules/idea.nix
    ../../home-modules/office.nix
    ../../home-modules/media.nix
    ../../home-modules/notifications.nix
    ../../home-modules/mathematica.nix
    ../../home-modules/browser.nix
    ../../home-modules/picom.nix
  ];

  # Let home manager install and manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
