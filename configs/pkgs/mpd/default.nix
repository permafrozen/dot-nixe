{ config, pkgs, lib, settings, ... }:

{
  environment.systemPackages = with pkgs; [
    mpc-cli
  ];

  services.mpd = {
    enable = true;
    musicDirectory = "/home/${settings.userName}/Music";
    user = "${settings.userName}";
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };

  systemd = {
    services = {
      mpd.environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
      };
    };
  };
}