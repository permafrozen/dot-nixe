{ pkgs, settings, lib, config, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.zathura = {
      enable = true;
      package = pkgs.zathura;
      options = {
        default-bg = lib.mkDefault
          "rgba(${config.lib.stylix.colors.base00-hex-r}, ${config.lib.stylix.colors.base00-hex-g}, ${config.lib.stylix.colors.base00-hex-a}, 0,5)";
      };
    };
  };
}
