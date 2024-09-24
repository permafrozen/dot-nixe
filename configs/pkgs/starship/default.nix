{ config, pkgs, ...}:

{
  home-manager.sharedModules = [{
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
      enableFishIntegration = true;
    };
  }];
}
