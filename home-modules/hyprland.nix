{ config, pkgs, ... }:
{

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      bind = "$mod, Return, exec, $terminal";
      input = {
        kb_layout = "us,us";
        kb_variant = "colemak_dh,";
        kb_options = "ctrl:swapcaps, grp:alt_shift_toggle";
      };
    };
  };
}
