{ config, pkgs, ... }: {
  imports = [ ./xkb.nix ];

  environment.systemPackages = with pkgs; [
    (pkgs.dmenu.override { patches = [./center.diff]; } )
    playerctl
    feh
    brightnessctl
    networkmanagerapplet
    (import ./dwmscripts/dwmswitch.nix { inherit pkgs; })
    (import ./dwmscripts/dwmtimer.nix { inherit pkgs; })
    (import ./dwmscripts/dwmsys.nix { inherit pkgs; })
    (import ./dwmscripts/dwmvpn.nix { inherit pkgs; })
    (pkgs.dwmblocks.overrideAttrs { src = ./dwmblocks; })
  ];

  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs { src = ./dwm; };
    };

    displayManager.lightdm = { enable = true; };
  };
}

