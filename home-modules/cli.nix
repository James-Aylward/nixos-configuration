{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    tree
    unzip
    ncdu
    file
    unzip
    usbutils
    nix-search-cli
    btop
    yazi
    fzf
    zoxide
    lazygit
  ];

  home.shellAliases = { lg = "lazygit"; };

  programs.fzf.tmux.enableShellIntegration = true;
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };

}
