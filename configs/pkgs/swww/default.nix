{ config, pkgs, settings, ...}:

{
  environment.systemPackages  = with pkgs; [
    swww
  ];

  systemd.services.swww-daemon = {
    description = "Swww Daemon";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ]; # Adjust as needed
    serviceConfig = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "always";
      User = "${settings.userName}";
    };
  };

  home-manager.sharedModules = [{
    wayland.windowManager.hyprland.extraConfig = ''

    '';
  }];
}
