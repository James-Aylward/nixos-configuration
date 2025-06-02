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
    moreutils # for tmux resurrect
  ];

  programs.btop.enable = true;
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
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:RGB"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      tmux-fzf
      resurrect
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '1' # minutes
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-processes 'ssh ghc ghci ghcid'
          set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
        '';
      }

    ];
  };

}
