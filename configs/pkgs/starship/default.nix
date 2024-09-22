{ config, pkgs, ...}:

{
  home-manager.sharedModules = [{
    programs.starship = {
      settings = {
        add_newline = true;
      };
      enableFishIntegration = true;
    };
  }];
}
