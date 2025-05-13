{ config, pkgs, ... }: {

  #programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.image = ../images/nix.png;
  stylix.polarity = "dark";
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
