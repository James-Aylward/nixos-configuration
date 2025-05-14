{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/desktop-environment/dwm-with-blocks.nix
    #../../modules/desktop-environment/cinnamon.nix
    ../../modules/common.nix
    ../../modules/virtualisation.nix
    ../../modules/audio.nix
    ../../modules/wireguard.nix
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  networking.hostName = "renix-server"; # Define your hostname.
  services.openssh.enable = true;
  services.xserver.dpi = 192;
  environment.variables = rec {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_SCALE_FACTOR = "2";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
  services.xserver.displayManager.importedVariables =
    [ "QT_AUTO_SCREEN_SCALE_FACTOR" "QT_SCALE_FACTOR" "_JAVA_OPTIONS" ];

  # Enable networking
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Brisbane";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  users.users.jamesa = {
    isNormalUser = true;
    description = "jamesa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  home-manager.users.jamesa = import ./home.nix;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ ];

  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.hardware.bolt.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11"; # Did you read the comment?

}
