{ config, pkgs, ... }: {

  home.packages = with pkgs; [ tree unzip ncdu file ];


  programs.vim.enable = true;
  programs.yazi = { enable = true; };
  programs.fzf = { enable = true; };
  programs.zoxide = { enable = true; };
  programs.lazygit.enable = true;
  home.shellAliases = { lg = "lazygit"; };
  programs.btop = { enable = true; };
}
