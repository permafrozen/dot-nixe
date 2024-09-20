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
        };
      };
    };
  }];
}
