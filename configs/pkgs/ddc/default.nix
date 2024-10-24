 { config, pkgs, settings, ... }: 

 {
  environment.systemPackages = with pkgs; [
    ddcutil
    # ddcui
  ];

  # udev Rule
  services = {
    udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';
  };

  # Kernel Changes
  boot = {
    kernelModules = ["i2c-dev"];
    extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
  };

  hardware.i2c.enable = true;
  users.users.${settings.userName}.extraGroups = [ "i2c" ];
 }