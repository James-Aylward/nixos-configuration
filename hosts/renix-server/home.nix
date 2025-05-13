{ config, pkgs, ... }:

{
  home.username = "jamesa";
  home.homeDirectory = "/home/jamesa";

  imports = [
    ../../home-modules/cli.nix
    ../../home-modules/desktop-utility.nix

    # office
    ../../home-modules/shell.nix
    ../../home-modules/terminal.nix
    ../../home-modules/version-control.nix
    ../../home-modules/neovim/neovim.nix
    ../../home-modules/office.nix
    ../../home-modules/browser.nix
  ];

  # Let home manager install and manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
