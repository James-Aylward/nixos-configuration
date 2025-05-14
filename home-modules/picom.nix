{ config, pkgs, ... }: {
  services.picom = {
    enable = true;
    fadeDelta = 5;
    fade = true;
    activeOpacity = 0.95;
    inactiveOpacity = 0.95;
    opacityRules = [
      "100:class_g = 'firefox'"
      "100:class_g = 'sioyek'"
      "100:class_g = 'darktable'"
      "100:class_g = 'feh'"
      "100:class_g = 'obsidian'"
      "100:class_g = 'org.remmina.Remmina'"
      "100:class_g = 'code'"
      "100:class_g = 'VirtualBox Machine'"
      "100:class_g = 'qimgv'"
      "100:class_g = 'vlc'"
      "100:class_g = 'dmenu'"
      "100:class_g = 'dwm'"
      "100:class_g = 'qutebrowser'"
    ];
    fadeExclude = [ "class_g = 'dmenu'" ];
  };
}
