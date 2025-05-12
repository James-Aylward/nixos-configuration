{ config, pkgs, ... }: {

    home.sessionVariables.EDITOR = "nvim";
    home.file.".config/nvim".source = ./neovim-dotfiles;

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

    # TODO would love to cleanup
    extraPackages = with pkgs; [
      tree-sitter
      texlab
      rocmPackages.llvm.clang
      pyright
      haskellPackages.haskell-language-server
      nixd
      nixpkgs-fmt
      nodejs-slim
      lua-language-server
      ripgrep
      rust-analyzer
      rubber
    ];

  };
}
