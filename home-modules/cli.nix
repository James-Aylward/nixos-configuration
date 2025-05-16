{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    tree
    zip
    unzip
    ncdu
    file
    unzip
    usbutils
    nix-search-cli
    btop
    tldr
    nixfmt-classic
  ];

  programs.lazygit.enable = true;
  home.shellAliases = { lg = "lazygit"; };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf.tmux.enableShellIntegration = true;

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };

}
