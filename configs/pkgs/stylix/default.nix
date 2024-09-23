{ config, pkgs, settings, ...}:

{
  home-manager.sharedModules = [{
    stylix = {
      enable = true;
      autoEnable = false;
      image = "~/.dot-nixe/assets/wallpapers/space.png";
      base16Scheme = "~/.dot-nixe/assets/schemes/nord.yaml";
    };
  }];
}
