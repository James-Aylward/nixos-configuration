{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    tree
    unzip
    ncdu
  ];

  programs.vim.enable = true;

  # TODO colors
  programs.yazi = {
    enable = true;
  };

  # TODO colors
  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.lazygit.enable = true;
  home.shellAliases = { lg = "lazygit"; };

  # TODO colors
  programs.btop = {
    enable = true;
  };
}
