{ config, settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = { hide_cursor = true; };

        background = {
          path =
            "/home/${settings.userName}/.dot-nixe/assets/wallpapers/${settings.wallpaper}";
          color =
            "rgba(${config.lib.stylix.colors.base00-rgb-r}, ${config.lib.stylix.colors.base00-rgb-g}, ${config.lib.stylix.colors.base00-rgb-b}, ${settings.opacity})";

          # Blur
          # blur_size = "10";
          # blur_passes = "4";
          # noise = "0.0420";
          # contrast = "1.0";
          # vibrancy = "1.0";
          # vibrancy_darkness = "0.1069";
        };

        input-field = {
          monitor = "";

          # Size
          size = "200, 50";
          outline_thickness = "2";

          # Dots
          dots_size = "0.2";
          dots_spacing = "0.5";
          dots_center = true;
          dots_text_format = "";

          # Color Setting
          outer_color =
            "rgba(${config.lib.stylix.colors.base00-rgb-r}, ${config.lib.stylix.colors.base00-rgb-g}, ${config.lib.stylix.colors.base00-rgb-b}, 0)";
          inner_color =
            "rgba(${config.lib.stylix.colors.base00-rgb-r}, ${config.lib.stylix.colors.base00-rgb-g}, ${config.lib.stylix.colors.base00-rgb-b}, 0)";
          font_color =
            "rgb(${config.lib.stylix.colors.base05-rgb-r}, ${config.lib.stylix.colors.base05-rgb-g}, ${config.lib.stylix.colors.base05-rgb-b})";
          check_color =
            "rgb(${config.lib.stylix.colors.base05-rgb-r}, ${config.lib.stylix.colors.base05-rgb-g}, ${config.lib.stylix.colors.base05-rgb-b})";
          fail_color =
            "rgb(${config.lib.stylix.colors.base08-rgb-r}, ${config.lib.stylix.colors.base08-rgb-g}, ${config.lib.stylix.colors.base08-rgb-b})";
          capslock_color =
            "rgb(${config.lib.stylix.colors.base0A-rgb-r}, ${config.lib.stylix.colors.base0A-rgb-g}, ${config.lib.stylix.colors.base0A-rgb-b})";
          numlock_color =
            "rgb(${config.lib.stylix.colors.base0A-rgb-r}, ${config.lib.stylix.colors.base0A-rgb-g}, ${config.lib.stylix.colors.base0A-rgb-b})";
          bothlock_color =
            "rgb(${config.lib.stylix.colors.base08-rgb-r}, ${config.lib.stylix.colors.base08-rgb-g}, ${config.lib.stylix.colors.base08-rgb-b})";

          # Font
          font_family = "${config.stylix.fonts.monospace.name}";

          # Misc
          placeholder_text = "";

          # Align
          halign = "center";
          valign = "center";
        };

        label = [
          {
            monitor = "";
            text = "Hi there, $USER";
            text_align = "center";
            color =
              "rgb(${config.lib.stylix.colors.base05-rgb-r}, ${config.lib.stylix.colors.base05-rgb-g}, ${config.lib.stylix.colors.base05-rgb-b})";
            font_size = "25";
            font_family = "${config.stylix.fonts.monospace.name}";

            rotate = "0"; # degrees, counter-clockwise

            position = "0, 80";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            text = "$TIME";
            text_align = "center";
            color =
              "rgb(${config.lib.stylix.colors.base06-rgb-r}, ${config.lib.stylix.colors.base06-rgb-g}, ${config.lib.stylix.colors.base06-rgb-b})";
            font_size = "65";
            font_family = "${config.stylix.fonts.monospace.name}";
            rotate = "0"; # degrees, counter-clockwise

            position = "0, 200";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
