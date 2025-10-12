{ config, pkgs, ... }: {

  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver.displayManager.setupCommands = ''
    localectl --no-convert set-x11-keymap us,us colemak_dh, grp:alt_space_toggle
  '';

  environment.systemPackages = with pkgs; [ cliphist ];
  programs.hyprland.enable = true;
}
