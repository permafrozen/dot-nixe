{ configs, pkgs, settings, ...}:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    hyprshot # for screenshots
  ];

  home-manager.sharedModules = [{
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {

        general = {
          "$mainMod" = "SUPER";

          border_size = "1";
          "col.inactive_border" = "0xffFFFFFF";
          "col.active_border" = "0xffFFFFFF";
          resize_on_border = "true";
          
          gaps_in = "5";
          gaps_out = "5";


          layout = "dwindle";
          allow_tearing = "false";
        };

        decoration = {
          rounding = "5";

          active_opacity = "1";
          inactive_opacity = "1";
          fullscreen_opacity = "1";

          drop_shadow = "false";
          shadow_range = "4";
          shadow_render_power = "4";
          shadow_ignore_window = "true";
          "col.shadow" = "0xeeFFFFFF";
          "col.shadow_inactive" = "0xeeFFFFFF";

          dim_inactive = "false";
          dim_strength = "0.5";

          blur = {
            enabled = "true";
            size = "8";
            passes = "1";
            ignore_opacity = "false";
            xray = "true";
            popups = "true";
          };
        };

        animations = {
          enabled = "true";
          first_launch_animation = "true";

          bezier = [
            "fluent_decel, 0, 0.2, 0.4, 1"
            "easeOutCirc, 0, 0.55, 0.45, 1"
            "easeOutCubic, 0.33, 1, 0.68, 1"
            "easeinoutsine, 0.37, 0, 0.63, 1"
          ];

          animation = [
            # Windows
            "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
            "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
            "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

            # Fade
            "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
            "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
            "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
            "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
            "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
            "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
            "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
            "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
          ];
        };

        bind = [
          "$mainMod, T, exec, kitty"
          "$mainMod, Q, killactive,"
        ];

        input = {
          kb_layout = "de";
        };

        gestures = {
          workspace_swipe = "false";
          workspace_swipe_fingers = "3";
        };

        misc = {
          disable_hyprland_logo	= "true";
          disable_splash_rendering = "true";
          background_color = "0xFFFFFF";
        };
      };

      extraConfig = ''
        monitor = eDP-1, 1920x1080@60, 0x0, 1;
      '';
    };
  }];
}
