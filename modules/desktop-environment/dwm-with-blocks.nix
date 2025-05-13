{ config, pkgs, ... }: {
  imports = [
    ./xkb.nix
    ./picom.nix
  ];
  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs { src = ./dwm; };
    };
  };
}

