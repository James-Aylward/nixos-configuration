{ config, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [ xclip ];

  stylix.enable = true;
  stylix.opacity.terminal = 0.85;
  stylix.base16Scheme =
    "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.image = ../images/nix.png;
  stylix.targets.grub.useWallpaper = true;
  stylix.polarity = "dark";
  
  stylix.cursor = {
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePine-Linux";
        size = 32;
  };

  stylix.fonts.sizes = { terminal = 10; };
  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };
  };
}
