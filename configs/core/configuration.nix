{ settings, pkgs, ... }:

let path = pkg: ../../configs/pkgs/${pkg}/default.nix;
in {
  imports = [ ../../hosts/${settings.hostPreset}/hardware-configuration.nix ]
    ++ map path settings.pkgs;

  # Packages
  environment.systemPackages = with pkgs; [
    inotify-tools
    acpi
    bat
    curl
    nurl
    eza
    file
    fzf
    git
    nix-melt
    nixfmt-classic
    nix-output-monitor
    wget
    zip
    unzip
    brightnessctl
    nodejs
    pnpm
    udiskie
    figlet
    pipes
    vitetris
  ];

  # Laptop Settings
  services.logind.lidSwitch = "ignore"; # only turns off screen on lid close

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Bootloader.
  # boot.loader = {
  #  systemd-boot.enable = false;
  #  grub = {
  #    enable = true;
  #    device = "nodev";
  #    efiSupport = true;
  #    # useOSProber = true;
  #  };
  #  efi = { canTouchEfiVariables = true; };
  #};

  networking = {
    hostName = "${settings.hostName}";
    networkmanager.enable = true;
  };

  time.timeZone = "${settings.timeZone}";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "${settings.locale}.UTF-8";
      LC_IDENTIFICATION = "${settings.locale}.UTF-8";
      LC_MEASUREMENT = "${settings.locale}.UTF-8";
      LC_MONETARY = "${settings.locale}.UTF-8";
      LC_NAME = "${settings.locale}.UTF-8";
      LC_NUMERIC = "${settings.locale}.UTF-8";
      LC_PAPER = "${settings.locale}.UTF-8";
      LC_TELEPHONE = "${settings.locale}.UTF-8";
      LC_TIME = "${settings.locale}.UTF-8";
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
  users = {
    users.${settings.userName} = {
      isNormalUser = true;
      description = "${settings.userName}";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # System Settings
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05"; # be careful with this one
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
