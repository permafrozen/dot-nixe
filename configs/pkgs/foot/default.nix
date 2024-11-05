{ config, pkgs, settings, lib, ... }:

{
  programs.foot = {
    enableFishIntegration = true;
  };

  home-manager.users.${settings.userName} = {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        cursor = {
          style = "underline";
          blink = true;
        };
        mouse = {
          hide-when-typing = true;
        };
        colors = {
          alpha = lib.mkForce "${settings.opacity}";
        };
      };
    };
    stylix.targets.foot.enable = true;
  };
}