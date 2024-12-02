{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ swww ];

  home-manager.users.${settings.userName} = {
    wayland.windowManager.hyprland.extraConfig = ''
      exec-once = swww-daemon
      exec = ${./.}/random_bg.sh ${../../../.}/assets/wallpapers/
    '';
      # exec = swww img ${../../../.}/assets/wallpapers/${settings.wallpaper} -t grow --transition-fps 100 
  };
}
