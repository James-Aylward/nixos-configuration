{ config, pkgs, ... }: {

    home.sessionVariables.EDITOR = "nvim";
    home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles;

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

   plugins = [
	pkgs.vimPlugins.nvim-treesitter.withAllGrammars
];

    # TODO would love to cleanup
    extraPackages = with pkgs; [
      #tree-sitter
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
