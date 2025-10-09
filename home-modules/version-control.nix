{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "james.michael.aylward@gmail.com";
    userName = "James Aylward";
  };

  programs.gh.enable = true;
}
