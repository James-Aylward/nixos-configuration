{ config, pkgs, ... }:
{

  nixpkgs.overlays = [ (import ../overlays.nix) ];
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showStartupLaunchMessage = false;
        #  uiColor = "#d79921";
        #  contrastUiColor = "#282828";
      };
    };
  };

  services.blueman-applet.enable = true;

  programs.obs-studio.enable = true;

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

}
