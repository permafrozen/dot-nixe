{ config, pkgs, settings, ... }:

{
  imports = [
    ../../hosts/laptop/hardware-configuration.nix
    ../../hosts/laptop/profile.nix
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

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "${settings.timeZone}";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "${settings.kbLayout}";
    variant = "";
  };

  # Set console keymap to de
  console.keyMap = "${settings.kbLayout}"; #vars.keyMap;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${settings.userName} = {
    isNormalUser = true;
    description = "${settings.userName}";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];

  };

  # Core Packages
  environment.systemPackages = with pkgs; [
    acpi
    git
    wget
    nurl
    vim
    tree
  ];

  # Font Packages
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {
            main."monitor.libcamera" = "disabled";
	       };
	     };
      };
    };
  };

  # Enable the user-level service manager to start PipeWire automatically
  systemd.user.services = {
    pipewire.wantedBy = [ "default.target" ];
    pipewire-pulse.wantedBy = [ "default.target" ];
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05"; # be careful with this one

  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

}
