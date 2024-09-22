{ config, pkgs, settings, ...}:

{
  home-manager.sharedModules = [{
    programs.kitty = {
      enable = true;
      settings = {
        foreground = "#FFFFFF";
        background = "#000000";

        background_opacity = 0.7;
        background_blur = 7;
      };
    };
  }];
}
