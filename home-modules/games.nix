{ config, pkgs, ... }: {

  programs.lutris = {
    enable = true;
    extraPackages = [ pkgs.wine ];
  };
}
