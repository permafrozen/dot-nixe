{ config, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "$HOME/Desktop";
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      publicShare = "$HOME/Public";
      extraConfig = {
        DEVELOPMENT = "$HOME/Dev";
        VIRTUALISATION = "$HOME/Virtualisation";
      };
    };
  };
}
