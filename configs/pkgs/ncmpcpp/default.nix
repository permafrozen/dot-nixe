{ config, pkgs, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.ncmpcpp = {
      enable = true;
      settings = {

      };
    };
  };
}