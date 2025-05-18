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
    tldr
    nixfmt-classic
  ];

  programs.btop.enable = true;
  programs.lazygit.enable = true;
  home.shellAliases = { lg = "lazygit"; };

  # TODO remove
  home.shellAliases = { m = "bear -- make"; };

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
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:RGB"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      sensible
      tmux-fzf
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '1' # minutes
          set -g @resurrect-strategy-nvim 'session'
        '';
      }

    ];
  };

}
