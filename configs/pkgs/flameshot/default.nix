{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    services.flameshot = {
      enable = true;
      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          savePath = "Pictures/Screenshots";
          saveAsFileExtension = ".png";
          uiColor = "#${config.lib.stylix.colors.base00}";
          contrastUiColor = "#${config.lib.stylix.colors.base05}";
          drawColor = "#${config.lib.stylix.colors.base05}";
        };
      };
    };
  };
}