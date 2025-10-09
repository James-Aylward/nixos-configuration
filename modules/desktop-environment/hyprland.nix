{ config, pkgs, ... }: {
  programs.hyprland.enable = true; # enable Hyprland

  environment.systemPackages = [
    pkgs.kitty # required for the default Hyprland config
  ];
}
