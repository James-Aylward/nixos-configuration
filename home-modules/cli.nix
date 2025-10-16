{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    tree
    sysz
    zip
    unzip
    lazyssh
    pwgen
    nixfmt
    macchanger
    ncdu
    file
    unzip
    pastel
    usbutils
    nix-search-cli
    tlrc
    moreutils # for tmux resurrect
  ];

  programs.btop.enable = true;
  programs.lazygit.enable = true;
  home.shellAliases = {
    lg = "lazygit";
    sex = "sudo chmod +x";
  };

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
    plugins = with pkgs.tmuxPlugins; [
      sensible
      tmux-fzf
      better-mouse-mode
      tmux-which-key
      prefix-highlight
    ];
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:RGB"
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'
    '';
  };

}
