{ config, pkgs, ... }: {
  services.xserver.xkb = {
    layout = "us,us,ru";
    variant = "colemak_dh,,";
    options = "grp:alt_space_toggle, ctrl:swapcaps";
    #";
  };
}
