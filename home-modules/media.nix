{ config, pkgs, ... }: {
  home.packages = with pkgs; [ vlc darktable imagemagick qimgv ];
}
