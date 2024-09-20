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
          border_size = "1";
          gaps_in = "5";
          gaps_out = "5";
          "col.inactive_border" = "0xffFFFFFF";
          "col.active_border" = "0xffFFFFFF";
          layout = "dwindle";
          resize_on_border = "true";
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


        };
      };
    };
  }];
}
