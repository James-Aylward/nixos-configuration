{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      pgf
      ec
      gensymb
      cm-super
      environ
      txfonts
      parskip
      pgfplots
      etoolbox
      stackengine
      advdate
      titlesec
      pdfpages
      pdflscape
      float
      microtype
      siunitx
      tcolorbox;
  });
in
{
  home.packages = with pkgs; [
    tex
    libreoffice-fresh
    hunspell
    hunspellDicts.en-au-large
  ];

  # TODO colors
  programs.sioyek.enable = true;
}
