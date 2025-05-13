{ config, pkgs, ... }: {

  #programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  stylix.enable = true;
  #stylix.targets.neovim.enable = false;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/espresso.yaml";
}
