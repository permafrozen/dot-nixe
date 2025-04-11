{ pkgs, settings, ... }:

let wallpaper = "${../../../.}/assets/wallpapers/${settings.wallpaper}";

in {
  environment.systemPackages = [ pkgs.hyprpaper ];
  home-manager.users.${settings.userName} = {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "off";
        splash = false;
        preload = [ wallpaper ];
        wallpaper = ",${wallpaper}";
      };
    };

    wayland.windowManager.hyprland.extraConfig = ''
      exec-once = hyprpaper
    '';
  };
}
