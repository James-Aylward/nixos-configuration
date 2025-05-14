{ config, pkgs, lib, ... }: {

  home.sessionVariables.EDITOR = "nvim";
  #home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = lib.fileContents ./options.lua + "\n" + lib.fileContents ./keybinds.lua;
    plugins = with pkgs.vimPlugins; [
      # Utility
      {
        plugin = marks-nvim;
        type = "lua";
	config = builtins.readFile ./marks-nvim.lua;
      }
      {
        plugin = telescope-nvim;
        type = "lua";
	config = builtins.readFile ./telescope-nvim.lua;
      }
      auto-pairs

      # LaTeX
      {
        plugin = knap;
        type = "lua";
	config = builtins.readFile ./knap.lua;
      }
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
