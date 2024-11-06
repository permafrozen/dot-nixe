{ config, pkgs, settings, lib, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.kitty = {
      enable = true;
      settings = {

        # Colors
        foreground = lib.mkDefault "#${config.lib.stylix.colors.base05}";
        background = lib.mkDefault "#${config.lib.stylix.colors.base00}";
        background_opacity = lib.mkForce 1;
        background_blur = lib.mkForce 0;

        # Miscellaneous
        confirm_os_window_close = "0";
        cursor_shape_unfocused = "unchanged";

        # Window Margins
        window_margin_width = 5;
        window_padding_width = 5;
      };
    };
    stylix.targets = {
      kitty.enable = true;
      bat.enable = true;
    };
  };
}
