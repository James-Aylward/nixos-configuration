{ config, pkgs, ... }: {
  home.packages = with pkgs; [ vlc darktable imagemagick qimgv yt-dlp ];

  programs.mpv = { enable = true; };

  programs.foliate.enable = true;
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
