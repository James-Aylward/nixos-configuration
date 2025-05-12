{ config, pkgs, ... }:

{
  home.username = "jamesa";
  home.homeDirectory = "/home/jamesa";

  imports = [
    ../../home-modules/version-control.nix
    ../../home-modules/shell.nix
    ../../home-modules/terminal.nix
    ../../home-modules/editor.nix
  ];

  # Let home manager install and manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
