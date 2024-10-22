{ config, pkgs, settings, ... }:

{
  services = {
  syncthing = {
    enable = true;
    user = "${settings.userName}";
    dataDir = "/home/${settings.userName}/Documents/Synced";
    configDir = "/home/${settings.userName}/Documents/Synced/.config/syncthing";
    overrideDevices = true;     # overrides any devices added or deleted through the WebUI
    overrideFolders = true;     # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "your-laptop" = { id = "YOUR-KEY"; };
        "your-phone" = { id = "YOUR-KEY"; };
      };
      folders = {
        "Documents/Synced" = {                    # Folder ID in Syncthing, also the name of folder (label) by default
          label = "Schule";
          path = "/home/${settings.userName}/Documents/Synced";    # Which folder to add to Syncthing
          devices = [ "your-laptop" "your-phone" ];      # Which devices to share the folder with
        };
      };
    };
  };
};

  # Disable default folder
  systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true";
  
  # Ports for Syncthing
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}