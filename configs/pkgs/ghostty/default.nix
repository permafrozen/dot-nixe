{ config, pkgs, settings, ... }:

{
  environment.systemPackages = [ pkgs.ghostty ];

  home-manager.users.${settings.userName} = {
    programs.ghostty = {
      enable = true;
      clearDefaultKeybinds = true;
      settings = {
        keybind = [
          "ctrl+shift+c=copy_to_clipboard"
          "ctrl+shift+v=paste_from_clipboard"
        ];
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
        font-family = "${config.stylix.fonts.monospace.name}";
        font-size = "${settings.font-size}";
        window-padding-x = 10;
        window-padding-y = 10;
      };
    };
  };
}
