{ pkgs, config, settings, ... }:

{
  environment.systemPackages = [ pkgs.kdePackages.xwaylandvideobridge ];
  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland = {
      settings = {
        # Enable Full Log
        # debug.disable_logs = "false";

        # Variables
        "$mainMod" = "SUPER";
        "$altMod" = "SUPER_ALT";
        "$cursor" = "${settings.hyprcursor}";
        "$browser" = "${settings.browser}";
        "$explorer" = "nautilus";
        "$terminal" = "${settings.terminal}";
        "$todolist" = "io.github.alainm23.planify";
        "$screenlock" = "hyprlock";
        "$runner" =
          "walker"; # "wlalker --modules applications"; "rofi -show drun -theme default";
        "$statusbar" = "aglet";

        # Set Cursor
        env = [ "HYPRCURSOR_THEME,$cursor" "HYPRCURSOR_SIZE,32" ];

        general = {
          border_size = "2";
          "col.active_border" = "0xff${config.lib.stylix.colors.base05}";
          "col.inactive_border" = "0xff${config.lib.stylix.colors.base02}";
          resize_on_border = "true";

          gaps_in = "15";
          gaps_out = "30";
          gaps_workspaces = "0";

          layout = "dwindle";
          allow_tearing = "true";
        };

        decoration = {
          rounding = "15";

          active_opacity = "1";
          inactive_opacity = "1";
          fullscreen_opacity = "1";

          shadow = {
            enabled = "false";
            range = "16";
            render_power = "20";
            ignore_window = "true";
            color = "0xee${config.lib.stylix.colors.base05}";
            color_inactive = "0xee${config.lib.stylix.colors.base00}";
            sharp = "false";
            scale = "1.0";
          };

          dim_inactive = "false";
          dim_strength = "0.2";

          blur = {
            enabled = "true";
            size = "10";
            passes = "3";
            noise = "0.0020";
            contrast = "1.0";
            vibrancy = "1.0";
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
            "easeOutCubic, 0.33, 1.0, 0.68, 1.0"
            "easeOutQuart, 0.25, 1.0, 0.5, 1.0"
            "easeOutExpo, 0.16, 1.0, 0.3, 1.0"
            "nothing, 0, 0, 1, 1"
          ];

          animation = [
            # windows in & out
            "windowsIn, 1, 9, easeOutCubic, popin 80%"
            "windowsOut, 1, 9, easeOutCubic, popin 80%"
            "windowsMove, 1, 9, easeOutCubic, popin"

            # Workspaces in & out
            "workspacesIn, 1, 6, easeOutExpo, slide"
            "workspacesOut, 1, 6, easeOutExpo, slide"
          ];
        };

        exec-once = [
          "$statusbar"
          "$terminal"
          "walker --gapplication-service"
          "hyprctl setcursor $cursor 32"
        ];

        bind = [
          # Executables
          "$mainMod, A, exec, $runner"
          "$mainMod, T, exec, $terminal"
          "$mainMod, S, exec, $browser"
          "$mainMod, E, exec, $explorer"
          "$mainMod, W, exec, $todolist"
          "$mainMod, C, exec, $screenlock"

          # Window/Session killing
          "$mainMod, Q, killactive,"
          "$mainMod, M, exit,"

          # Fullscreen Controls
          "$mainMod, F, fullscreen,"
          "$altMod, F, fullscreen, 1"

          # Resizing Controls
          # TODO

          # Screenshot keybinds
          "$mainMod, PRINT, exec, hyprshot -m region"

          # Windowfocus Controls
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
          "$altMod, 1, movetoworkspacesilent, 1"
          "$altMod, 2, movetoworkspacesilent, 2"
          "$altMod, 3, movetoworkspacesilent, 3"
          "$altMod, 4, movetoworkspacesilent, 4"
          "$altMod, 5, movetoworkspacesilent, 5"
          "$altMod, 6, movetoworkspacesilent, 6"
          "$altMod, 7, movetoworkspacesilent, 7"
          "$altMod, 8, movetoworkspacesilent, 8"
          "$altMod, 9, movetoworkspacesilent, 9"
          "$altMod, 0, movetoworkspacesilent, 10"
        ];

        # Cursor resize/move
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        input = {
          kb_layout = "de";
          mouse_refocus = "false";
          follow_mouse = 0;
        };

        cursor = { inactive_timeout = 2; };

        gestures = {
          workspace_swipe = "false";
          workspace_swipe_fingers = "3";
        };

        misc = {
          disable_hyprland_logo = "true";
          disable_splash_rendering = "true";
          background_color = "0x${config.lib.stylix.colors.base00}";
        };

        workspace = [

          # Smart Gaps ------------------ #
          # "w[tv1], gapsout:0, gapsin:0"
          # "f[1], gapsout:0, gapsin:0"
          # ----------------------------- #

        ];

        windowrulev2 = [
          # xwayland video bridge
          "opacity 0.0 override, class:^(xwaylandvideobridge)$"
          "noanim, class:^(xwaylandvideobridge)$"
          "noinitialfocus, class:^(xwaylandvideobridge)$"
          "maxsize 1 1, class:^(xwaylandvideobridge)$"
          "noblur, class:^(xwaylandvideobridge)$"
          "nofocus, class:^(xwaylandvideobridge)$"

          # Smart Gaps ------------------ #
          # "bordersize 0, floating:0, onworkspace:w[tv1]"
          # "rounding 0, floating:0, onworkspace:w[tv1]"
          # "bordersize 0, floating:0, onworkspace:f[1]"
          # "rounding 0, floating:0, onworkspace:f[1]"
          # ----------------------------- #

          "maximize, class:^(mpv)$"
          "maximize, class:^(VSCodium)$"
          "opacity 1 1 1, class:^(foot)"
          "opacity 1 1 1, class:^(kitty)"
          # "fullscreen, class:^(.qemu-system-x86_64-wrapped)$"
        ];

        layerrule = [
          "blur, gtk-layer-shell"
          "blur, gtk4-layer-shell"
          "blur, walker"
          "ignorezero, gtk-layer-shell"
          "ignorezero, gtk4-layer-shell"
          "ignorezero, walker"
        ];
      };
    };
  };
}
