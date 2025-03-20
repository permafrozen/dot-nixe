{ pkgs, config, settings, lib, ... }:

let
  decToHex = decimalString:
    let
      decimal = builtins.fromJSON decimalString;
      integer = lib.strings.toInt (toString (builtins.floor (decimal * 255)));
      hex = lib.trivial.toHexString integer;
    in if (lib.stringLength hex) == 1 then "0${hex}" else hex;
in {
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
          border_size = "5";
          "col.active_border" =
            "0x${decToHex settings.opacity}${config.lib.stylix.colors.base05}";
          "col.inactive_border" =
            "0x${decToHex settings.opacity}${config.lib.stylix.colors.base02}";
          resize_on_border = "true";

          gaps_in = "10";
          gaps_out = "10";
          gaps_workspaces = "0";

          layout = "dwindle";
          allow_tearing = "true";
        };

        decoration = {
          rounding = "15";
          active_opacity = "1";
          inactive_opacity = "1";
          fullscreen_opacity = "1";
          shadow.enabled = "false";

          dim_inactive = "false";
          dim_strength = "0.2";

          blur = {
            enabled = true;
            contrast = "3.0";
            ignore_opacity = true;
            noise = "0.05";
            passes = "4";
            popups = true;
            size = "4";
            vibrancy = "10";
            vibrancy_darkness = "1";
            xray = true;
          };
        };

        animations = {
          enabled = "true";
          first_launch_animation = "false";

          bezier = [ "easeOutExpo, 0.16, 1.0, 0.3, 1.0" ];

          animation = [
            # windows in & out
            "windowsIn, 1, 4, easeOutExpo, popin"
            "windowsOut, 1, 4, easeOutExpo, popin"
            "windowsMove, 1, 4, easeOutExpo, popin"

            # Workspaces in & out
            "workspacesIn, 1, 4, easeOutExpo, slide"
            "workspacesOut, 1, 4, easeOutExpo, slide"

            # Layer Shell
            "layers, 1, 3, easeOutExpo, popin"
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

          # Pin to Middle
          "$mainMod, P, exec, hyprctl dispatch togglefloating && hyprctl dispatch pin && hyprctl dispatch resizeactive exact 80% 80% && hyprctl dispatch centerwindow"

          # Misc
          "$mainMod, O, swapnext"

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
          follow_mouse = "0";
        };

        cursor.inactive_timeout = "0.1";

        gestures = {
          workspace_swipe = "true";
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
        ];

        layerrule = [
          "blur, gtk-layer-shell"
          "blur, gtk4-layer-shell"
          "blur, walker"
          "ignorezero, gtk-layer-shell"
          "ignorezero, gtk4-layer-shell"
          "ignorezero, walker"
          "noanim, hyprpicker"
          "noanim, selection "
        ];
      };
    };
  };
}
