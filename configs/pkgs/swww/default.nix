{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ swww ];

  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland.extraConfig = ''
      exec-once = swww-daemon
      exec = swww img ${../../../.}/assets/wallpapers/${settings.wallpaper} -t grow --transition-fps 100
    '';
      # exec = swww img ${../../../.}/assets/wallpapers/${settings.wallpaper} -t grow --transition-fps 100 
      # exec = ${./.}/random_bg.sh ${../../../.}/assets/wallpapers/
  };
}
