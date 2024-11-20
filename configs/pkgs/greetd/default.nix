{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs; [ greetd.greetd ];

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "${settings.userName}";
      };
      default_session = initial_session;
    };
  };
}
