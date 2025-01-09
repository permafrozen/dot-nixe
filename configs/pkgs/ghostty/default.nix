{ config, pkgs, settings, ... }:

{
  environment.systemPackages = [ pkgs.ghostty ];

  home-manager.users.${settings.userName} = {
    home.file.".config/ghostty/config".text = ''
      background = ${config.lib.stylix.colors.base00}
      background-opacity = ${settings.opacity}
      foreground = ${config.lib.stylix.colors.base05} 

      window-titlebar-background = ${config.lib.stylix.colors.base00}
      window-titlebar-foreground = ${config.lib.stylix.colors.base05}

      resize-overlay = never
      gtk-titlebar = false
      confirm-close-surface = false

      cursor-style = bar
      cursor-style-blink = true
    '';
  };
}
