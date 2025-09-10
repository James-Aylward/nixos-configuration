{ config, pkgs, ... }: {

  stylix.targets.librewolf.profileNames = [ "jamesa" ];
  programs.librewolf = {
    enable = true;
    profiles.jamesa = {
      search.default = "ddg";
      search.engines = {
        arch-wiki = {
          name = "Arch Wiki";
          urls = [{
            template = "https://wiki.archlinux.org/index.php";
            params = [
              {
                name = "search";
                value = "{searchTerms}";
              }
            ];
          }];
          definedAliases = [ "@aw" ];
        };
        home-manager = {
          name = "Homemanager Options";
          urls = [{
            template = "https://home-manager-options.extranix.com";
            params = [
              {
                name = "release";
                value = "master";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@hm" ];
        };
        nix-options = {
          name = "Nix Options";
          urls = [{
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };

        nix-packages = {
          name = "Nix Packages";
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };
    };
  };
}
