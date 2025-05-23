{ config, pkgs, ... }: {

  imports = [ ./xkb.nix ];

  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
    displayManager.lightdm.enable = true;
  };
}
