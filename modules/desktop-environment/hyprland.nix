{ config, pkgs, ... }: {

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.hyprland.enable = true;
}
