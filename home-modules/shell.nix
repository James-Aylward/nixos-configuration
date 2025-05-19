{ config, pkgs, ... }: {

  home.packages = with pkgs; [ nitch ];

  home.shell.enableZshIntegration = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    silent = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = { IGNOREEOF = 3; };

    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" "copyfile" "vi-mode" ];
    };

    initContent = ''
      setopt ignore_eof
      nitch
    '';
  };
}
