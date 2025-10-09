{ config, pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    brightnessctl
    nwg-bar
    cliphist
    wl-clipboard
    networkmanagerapplet
  ];

  home.pointerCursor.hyprcursor.enable = true;
  home.pointerCursor.hyprcursor.size = 32;

  programs.wofi.enable = true;
  programs.hyprlock.enable = true;
  programs.hyprshot.enable = true;

  services.mako.enable = true;
  services.hyprpolkitagent.enable = true;
  services.hyprsunset.enable = true;

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "loginctl lock-session";

        }
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.waybar = {
    style = ''
        window#waybar {
            border-radius: 5px;
            border: 2px solid @base03;
        }
    '';
    enable = true;
    settings.mainBar = {
      height = 5;
      modules-left = [ "hyprland/workspaces" ];
      margin-left = 10;
      margin-right = 10;
      margin-top = 10;
      spacing = 10;
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "pulseaudio"
        "clock"
        "battery"
        "temperature"
        "tray"
        "hyprland/language"
        "idle_inhibitor"
      ];

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "  ";
          deactivated = "  ";
        };
      };

      "hyprland/language" = {
        format = "{}";
        format-en = "std";
        format-en-colemak_dh = "col";
      };

      "hyprland/window" = {
        format = "{initialTitle}";
        separate-outputs = true;
      };

      "pulseaudio" = {
        "format" = "{volume}% {icon}";
        "format-bluetooth" = "{volume}% {icon}";
        "format-muted" = "-% ";
        "format-icons" = {
          "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
          "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
          "headphone" = "";
          "hands-free" = "";
          "headset" = "";
          "phone" = "";
          "phone-muted" = "";
          "portable" = "";
          "car" = "";
          "default" = [
            ""
            ""
          ];
        };
        "scroll-step" = 1;
        "on-click" = "pavucontrol";
      };

      temperature = {
        format = "{temperatureC}°C ";
      };

      tray = {
        icon-size = 14;
        spacing = 10;
      };

      clock = {
        interval = 60;
        format = "{:%H:%M}";
        max-length = 25;
      };

      battery = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {

      # Aesthetic
      general = {
        "layout" = "master";
        "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base0E})";
        "gaps_in" = 10;
        "gaps_out" = 10;
        "resize_on_border" = true;
        "border_size" = 2;
      };
      decoration = {
        "rounding" = 5;
      };

      # Programs
      "$terminal" = "alacritty";
      "$browser" = "librewolf";
      "$notes" = "obsidian";
      "$menu" = "wofi --show drun";
      "$power" = "nwg-bar";
      "$screenshot-region" = "hyprshot -m region";
      "$screenshot-window" = "hyprshot -m window";

      "$mod" = "SUPER";

      exec-once = [
        "waybar"
        "nm-applet"
        "wl-paste --type text --watch cliphist store"

        "wl-paste --type image --watch cliphist store"
        "blueman-applet"
        "signal-desktop --start-in-tray"
        "pamixer --set-volume 0"
      ];

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod SHIFT, Q, killactive,"
        "$mod, R, exec, $menu"
        "$mod, B, exec, $browser"
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"

        # Change focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod SHIFT, Return, layoutmsg, swapwithmaster"
        "$mod SHIFT, Return, layoutmsg, focusmaster"
        "$mod, F, fullscreen"

        # System
        "$mod SHIFT, L, exec, hyprlock"
        "$mod, Escape, exec, $power"
        "$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mod SHIFT, S, exec, $screenshot-region"
        "$mod CTRL_SHIFT, S, exec, $screenshot-window"


        # Change workspace
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"
        ",XF86AudioMute, exec, pamixer -t"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      gesture = [
        "3, horizontal, workspace"
      ];

      input = {
        kb_layout = "us,us";
        kb_variant = "colemak_dh,";
        kb_options = "ctrl:swapcaps, grp:alt_space_toggle";
      };
    };
  };
}
