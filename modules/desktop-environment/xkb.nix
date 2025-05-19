{ config, pkgs, ... }: {
  services.xserver.xkb = {
    layout = "us,us";
    variant = "colemak_dh,";
    options = "grp:alt_space_toggle, ctrl:swapcaps";
    #";
  };
}
