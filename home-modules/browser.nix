{ config, pkgs, ... }: {

  programs.qutebrowser = {
    enable = true;
    extraConfig =
      "	c.hinst.chars = \"arstgmneio\"\n	c.colors.webpage.preferred_color_scheme = 'dark'\n";
  };

}
