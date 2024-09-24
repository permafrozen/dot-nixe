{ config, pkgs, settings, ...}:

{
  stylix = {
    enable = true;
    image = ../../../assets/wallpapers/space.png;
  };
  home-manager.sharedModules = [{
    stylix = {
      enable = true;
      autoEnable = false;
      image = ../../../assets/wallpapers/space.png;
      base16Scheme = ./. + "../../../../assets/schemes/eris.yaml";
    };
  }];
}
