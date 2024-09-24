{ config, pkgs, settings, ...}:

{
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];

  stylix = {
    enable = true;
    image = ../../../assets/wallpapers/${settings.wallpaper};
    base16Scheme = ./. + "../../../../assets/schemes/${settings.scheme}.yaml";
        fonts = {
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = {
          name = "Noto Emoji";
          package = pkgs.noto-fonts-emoji;
        };
        monospace= {
          name = "Hack Nerd Font";
          package = pkgs.nerdfonts;
        };
      };
  };

  home-manager.sharedModules = [{
    stylix = {
      enable = true;
      autoEnable = false;
      image = ../../../assets/wallpapers/space.png;
      base16Scheme = ./. + "../../../../assets/schemes/eris.yaml";
      fonts = {
        serif = config.stylix.fonts.monospace;
        sansSerif = config.stylix.fonts.monospace;
        emoji = {
          name = "Noto Emoji";
          package = pkgs.noto-fonts-emoji;
        };
        monospace= {
          name = "Hack Nerd Font";
          package = pkgs.nerdfonts;
        };
      };
    };
  }];
}
