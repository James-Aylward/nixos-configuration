self: super: {
  flameshot = super.flameshot.overrideAttrs (oldAttrs: {
    # extend old postInstall (if exists) with wrapProgram
    postInstall = (oldAttrs.postInstall or "") + ''
      wrapProgram $out/bin/flameshot --set QT_SCALE_FACTOR 0.5
    '';
  });
}
