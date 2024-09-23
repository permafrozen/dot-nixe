{ config, pkgs, settings, ...}:

{
  home-manager.sharedModules = [{
    programs = {
      fish = {
        enable = true;
        shellInit = ''
          set -U fish_greeting
          cd
        '';
      };
      kitty = {
        extraConfig = ''
          shell fish
        '';
      };
    };
  }];
}
