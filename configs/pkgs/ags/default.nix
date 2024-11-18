{ pkgs, inputs, settings, ... }:

{

  home-manager.users.${settings.userName} = {
    programs.ags = {
      enable = true;

      # ags config dir
      configDir = ./project;

      # additional packages to add to gjs's runtime
      extraPackages = with inputs.ags.packages.${pkgs.system}; [
        battery
        hyprland
        network
        mpris
        tray
        wireplumber
      ];
    };
  };

  # network cover art caching (for spotify)
  services.gvfs.enable = true;
  services.upower.enable = true;
}
