{ config, pkgs, ... }: {

  stylix.targets.librewolf.profileNames = [ "jamesa" ];
  programs.librewolf = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
    profiles.jamesa = {
      search.engines = {
        arch-wiki = {
          name = "Arch Wiki";
          urls = [{
            template = "https://wiki.archlinux.org/index.php";
            params = [{
              name = "search";
              value = "{searchTerms}";
            }];
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
