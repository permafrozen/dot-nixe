{ config, pkgs, settings, ... }:

{
  imports = [
    ../../hosts/${settings.hostPreset}/hardware-configuration.nix
    ../../hosts/${settings.hostPreset}/profile.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = false;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };

    efi = {
      canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "${settings.hostName}";
    networkmanager.enable = true;
  };

  time.timeZone = "${settings.timeZone}";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_AT.UTF-8";
      LC_IDENTIFICATION = "de_AT.UTF-8";
      LC_MEASUREMENT = "de_AT.UTF-8";
      LC_MONETARY = "de_AT.UTF-8";
      LC_NAME = "de_AT.UTF-8";
      LC_NUMERIC = "de_AT.UTF-8";
      LC_PAPER = "de_AT.UTF-8";
      LC_TELEPHONE = "de_AT.UTF-8";
      LC_TIME = "de_AT.UTF-8";
    };
  };
# keyboard layout (xserver)
  services.xserver.xkb = {
    layout = "${settings.kbLayout}";
    variant = "";
  };

  # keyboard layout (tty)
  console.keyMap = "${settings.kbLayout}";

  # Define a user account
  users.users.${settings.userName} = {
    isNormalUser = true;
    description = "${settings.userName}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];

  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05"; # be careful with this one

  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

}
