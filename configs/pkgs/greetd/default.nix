{ pkgs, settings, ... }:

{
  environment.systemPackages = with pkgs.greetd; [
    greetd
    tuigreet
  ];

  # fix greetd being overwritten by systemd log
  boot.kernelParams = [ "console=tty2" ];
  services.greetd.vt = 1;

  # tuigreet config
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${pkgs.hyprland}/bin/Hyprland";
        user = "${settings.userName}";
      };
      default_session = initial_session;
    };
  };
}
