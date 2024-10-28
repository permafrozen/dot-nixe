{ config, pkgs, settings, ...}:

let
  flameshotWayland = pkgs.flameshot.overrideAttrs (oldAttrs: {
    configureFlags = oldAttrs.configureFlags or [] ++ [ "--USE_WAYLAND_GRIM=ON" ];
  });
in {
  environment.systemPackages = with pkgs; [
    grim
    slurp
  ];

  home-manager.users.${settings.userName} = {
    services.flameshot = {
      enable = true;
      package = flameshotWayland;
      settings = {
        General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          savePath = "/home/${settings.userName}/Pictures/Screenshots";
          saveAsFileExtension = ".png";
          uiColor = "#${config.lib.stylix.colors.base00}";
          contrastUiColor = "#${config.lib.stylix.colors.base05}";
          drawColor = "#${config.lib.stylix.colors.base05}";
        };
      };
    };
  };
}