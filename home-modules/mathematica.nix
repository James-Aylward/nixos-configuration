{ config, pkgs, ... }: {

    home.packages = [
    (pkgs.mathematica.override { version = "14.1.0"; })
    ];
}
