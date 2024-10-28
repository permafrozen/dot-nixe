{ config, pkgs, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.hyprlock = {
      enable = true;
      settings = {

      };
    };
  };
}