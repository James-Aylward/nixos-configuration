{ config, pkgs, ... }:

{
  home.username = "jamesa";
  home.homeDirectory = "/home/jamesa";

  imports = [
		./modules/version-control.nix
		./modules/shell.nix
	];

  # Let home manager install and manage itself
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
