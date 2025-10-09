{ config, pkgs, ... }:
{
  services.picom = {
    enable = true;
    shadow = true;
    #shadowExclude =
    #  [ "class_g = 'dwm'" "class_g = 'dmenu'" "class_g = 'dwmsystray'" ];
    #activeOpacity = 1;
    #inactiveOpacity = 0.98;
    opacityRules = [
      "97:class_g = 'Alacritty'"
      #  "100:class_g = 'firefox'"
      #  "100:class_g = 'sioyek'"
      #  "100:class_g = 'darktable'"
      #  "100:class_g = 'feh'"
      #  "100:class_g = 'obsidian'"
      #  "100:class_g = 'org.remmina.Remmina'"
      #  "100:class_g = 'code'"
      #  "100:class_g = 'VirtualBox Machine'"
      #  "100:class_g = 'qimgv'"
      #  "100:class_g = 'vlc'"
      #  "100:class_g = 'dmenu'"
      #  "100:class_g = 'dwm'"
      #  "100:class_g = 'qutebrowser'"
    ];
    #fadeExclude = [ "class_g = 'dmenu'" ];
  };
}
