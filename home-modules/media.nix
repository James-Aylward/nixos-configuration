{ config, pkgs, ... }: {
  home.packages = with pkgs; [ vlc darktable imagemagick qimgv ];

  programs.ncspot = {
    enable = true;
    settings = {
      use_nerdfont = true;
      notify = true;
      gapless = true;
      flip_status_indicators = true;
    };
  };

}
