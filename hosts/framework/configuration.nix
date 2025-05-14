{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    #../../modules/desktop-environment/dwm-with-blocks.nix
    ../../modules/desktop-environment/cinnamon.nix
    ../../modules/common.nix
    ../../modules/audio.nix
    ../../modules/wireguard.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "renix-server"; # Define your hostname.
  services.openssh.enable = true;

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

    environment.variables = rec {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_SCALE_FACTOR = "1.8";
  };

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
