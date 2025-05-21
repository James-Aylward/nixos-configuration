{ config, pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-basic pgf ec gensymb cm-super environ txfonts parskip pgfplots
      etoolbox stackengine advdate titlesec pdfpages pdflscape float microtype
      siunitx tcolorbox listings;
  });
in {
  home.packages = with pkgs; [
    tex
    libreoffice-fresh
    obsidian
    thunderbird
    hunspell
    hunspellDicts.en-au-large
  ];

  programs.sioyek.enable = true;

  programs.vesktop.enable = true;
}
