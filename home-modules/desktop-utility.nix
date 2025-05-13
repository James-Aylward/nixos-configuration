{ config, pkgs, ... }: {

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showStartupLaunchMessage = false;
        uiColor = "#d79921";
        contrastUiColor = "#282828";
      };
    };
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };

}
