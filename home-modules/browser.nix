{ config, pkgs, ... }: {

  programs.librewolf = {
    enable = true;
  };

  programs.qutebrowser = {
    enable = true;
    searchEngines = {
      np =
        "https://search.nixos.org/packages?channel=unstable&type=packages&query={}";
      no =
        "https://search.nixos.org/options?channel=unstable&type=packages&query={}";
      hm = "https://home-manager-options.extranix.com/?query={}&release=master";
    };

    extraConfig = ''
      c.hints.chars = "arstgmneio"
      c.colors.webpage.preferred_color_scheme = "dark"
      c.content.autoplay = False

      config.bind('Z', 'hint links spawn -d mpv --force-window=immediate {hint-url}')
    '';
  };

}
