{ config, pkgs, ... }: {

  home.sessionVariables.EDITOR = "nvim";
  #home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Utility
      marks-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
	config = builtins.readFile ./telescope-nvim.lua;
      }
      auto-pairs

      # LaTeX
      knap
      luasnip

      # Preeetty
      {
        plugin = lualine-nvim;
        type = "lua";
	config = builtins.readFile ./lualine-nvim.lua;
      }

      # LSP
      cmp-nvim-lsp # bridges the gap between lsp and completion
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile ./nvim-treesitter.lua;
      }
      {
        plugin = nvim-cmp;
        type = "lua";
	config = builtins.readFile ./nvim-cmp.lua;
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
	config = builtins.readFile ./nvim-lspconfig.lua;
      }
    ];

    # TODO would love to cleanup
    extraPackages = with pkgs; [
      rocmPackages.llvm.clang
      lua-language-server
      rust-analyzer
      texlab
      haskellPackages.haskell-language-server
      pyright
      nixd

      ripgrep
      rubber
    ];

  };
}
