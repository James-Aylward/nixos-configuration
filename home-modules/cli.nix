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
    lazygit
    tldr
    nixfmt
  ];

  home.shellAliases = { lg = "lazygit"; };

  programs.zoxide.enable = true;


  programs.fzf.tmux.enableShellIntegration = true;
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };

}
