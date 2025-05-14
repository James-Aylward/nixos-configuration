{ config, pkgs, ... }: {
  imports = [ ./xkb.nix ./picom.nix ];

  environment.systemPackages = with pkgs; [
    dmenu-rs
    playerctl
    feh
    brightnessctl
    networkmanagerapplet
    (import ./switch.nix { inherit pkgs; })
    (pkgs.dwmblocks.overrideAttrs { src = ./dwmblocks; })
  ];

  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs { src = ./dwm; };
    };
  };
}

