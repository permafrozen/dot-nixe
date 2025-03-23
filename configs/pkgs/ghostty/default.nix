{ config, pkgs, settings, ... }:

{
  environment.systemPackages = [ pkgs.ghostty ];

  home-manager.users.${settings.userName} = {
    programs.ghostty = {
      enable = true;
      clearDefaultKeybinds = true;
      settings = {
        foreground = "${config.lib.stylix.colors.base05}";
        background = "${config.lib.stylix.colors.base00}";
        background-opacity = "${settings.opacity}";
        window-titlebar-background = "${config.lib.stylix.colors.base00}";
        window-titlebar-foreground = "${config.lib.stylix.colors.base05}";
        resize-overlay = "never";
        gtk-titlebar = false;
        confirm-close-surface = false;
        cursor-style = "bar";
        cursor-style-blink = true;
        font-size = "${settings.font-size}";
        window-padding-x = 10;
      };
    };
  };
}
