{ inputs, config, pkgs, settings, ...}:

{
  # Hyprland Cache, so I don't have to compile it
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Hyprland NixOS Module
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    # Flake Inputs -> Hyprland Package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # For Screenshare
  environment = {
    variables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };
  
  # Hyprland Home-Manager Module
  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
      enable = true;

      # Flake Input -> Hyprland package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      plugins = [
        inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
        inputs.hyprland-easymotion.packages.${pkgs.system}.hyprland-easymotion
      ];

      settings = {

        plugin = {
          dynamic-cursors = {
            enabled = true;
              mode = "stretch"; # tilt, rotate, stretch, none
            shake = {
              enabled = false;
            };
          };

          easymotion = {
            textsize = "25";
            textcolor = "rgba(${config.lib.stylix.colors.base05}ff)";
            bgcolor = "rgba(${config.lib.stylix.colors.base00}ff)";
            textfont = "Hack Nerd Font";
            textpadding = "5 5 5 5"; # in px
            bordersize = "2";
            bordercolor = "rgba(${config.lib.stylix.colors.base0D}ff)";
            rounding = "${settings.rounding}";
            motionkeys = "abcdefghijklmnopqrstuvwxyz1234567890"; # Keys to use
          };
        };


        # Variables
        "$mainMod" = "SUPER";
        "$mainMod_SHIFT" = "SUPER_SHIFT";
        "$browser" = "${settings.browser}";
        "$explorer" = "nautilus";
        "$terminal" = "${settings.terminal}";

        general = {
          border_size = "2";
          "col.active_border" = "0xff${config.lib.stylix.colors.base0D}";
          "col.inactive_border" = "0xff${config.lib.stylix.colors.base03}";
          resize_on_border = "true";
          
          gaps_in = "${settings.gaps}";
          gaps_out = "${settings.gaps}";

          layout = "dwindle";
          allow_tearing = "false";
        };

        decoration = {
          rounding = "${settings.rounding}";

          active_opacity = "${settings.opacity}";
          inactive_opacity = "${settings.opacity}";
          fullscreen_opacity = "1";

          drop_shadow = "${settings.shadow}";
          shadow_range = "16";
          shadow_render_power = "20";
          shadow_ignore_window = "true";
          "col.shadow" = "0xee${config.lib.stylix.colors.base05}";
          "col.shadow_inactive" = "0xee${config.lib.stylix.colors.base00}";

          dim_inactive = "false";
          dim_strength = "0.2";

          blur = {
            enabled = "true";
            size = "2";
            passes = "3";
            noise = "0";
            contrast = "1.69";
            vibrancy = "0.1069";
            vibrancy_darkness = "0.1069";
            ignore_opacity = "true";
            xray = "true";
            popups = "true";
          };
        };

        animations = {
          enabled = "true";
          first_launch_animation = "true";

          bezier = [
            "easeOutQuart, 0.25, 1.0, 0.5, 1.0"
            "easeOutExpo, 0.16, 1.0, 0.3, 1.0"
            "nothing, 0, 0, 1, 1"
          ];

          animation = [
            # windows in & out
            "windowsIn, 1, 9, easeOutQuart, slide top"
            "windowsOut, 1, 9, easeOutQuart, slide bottom"
            "windowsMove, 1, 9, easeOutQuart, slide top"

            # Workspaces in & out
            "workspacesIn, 1, 6, easeOutExpo, slide"
            "workspacesOut, 1, 6, easeOutExpo, slide"

            # Fade in & out
            "fadeIn, 1, 5, nothing,"
            "fadeOut, 1, 5, nothing,"
          ];
        };

        bind = [
          # Executables
          "$mainMod, T, exec, $terminal"
          "$mainMod, S, exec, $browser"
          "$mainMod, E, exec, $explorer"
          "$mainMod, C, exec, hyprlock"

          # Window/Session killing
          "$mainMod, Q, killactive,"
          "$mainMod, M, exit,"

          # Fullscreen Controls
          "$mainMod, F, fullscreen,"
          "$mainMod_SHIFT, F, fullscreen, 1"

          # Resizing Controls
          # TODO

          # Screenshot keybinds
          "$mainMod, PRINT, exec, grim -g \"$(slurp -o -r -c '##ff0000ff')\" -t ppm - | satty --filename -"
          
          # Windowfocus Controls
          "$mainMod, V, easymotion, action:hyprctl dispatch focuswindow address:{},"
          "$mainMod, H, movefocus, l"
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"
          "$mainMod, L, movefocus, r"

          # move to workspace
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # move active window to workspace
          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        ];

        # Cursor resize/move
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        input = {
          kb_layout = "de";
          mouse_refocus = false;
          follow_mouse = 0;
        };

        cursor = {
          inactive_timeout = 2;
        };

        gestures = {
          workspace_swipe = "false";
          workspace_swipe_fingers = "3";
        };

        misc = {
          disable_hyprland_logo	= "true";
          disable_splash_rendering = "true";
          background_color = "0x${config.lib.stylix.colors.base00}";
        };

        windowrulev2 = [
          "maximize, class:^(mpv)$" # For watching anime
          "opacity 1 1 1, class:^(foot)"
          "opacity 1 1 1, class:^(kitty)"
          "fullscreen, class:^(.qemu-system-x86_64-wrapped)$"
        ];
      };

      extraConfig = settings.hyprConfig;
    };
  };
}
