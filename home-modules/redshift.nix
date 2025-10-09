{ config, pkgs, ... }:
{
  services.redshift = {
    enable = true;
    temperature.night = 3000;
    provider = "geoclue2";
    tray = true;
  };
}
