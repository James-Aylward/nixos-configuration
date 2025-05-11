{
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    nitch
  ];

  programs.fzf = {
    enable = true;
    # TODO colors here
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "copyfile" "fzf" "vi-mode" ];
    };
    initContent = ''
      nitch
    '';
  };
}
