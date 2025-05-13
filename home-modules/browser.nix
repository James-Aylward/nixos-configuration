{ config, pkgs, ... }: {

  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
c.hints.chars = "arstgmneio"
c.colors.webpage.preferred_color_scheme = "dark"
    '';
  };

}
