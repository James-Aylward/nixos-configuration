{ config, pkgs, ... }: {

    #programs.nix-ld.enable = true;
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

}
