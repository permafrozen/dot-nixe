{ config, pkgs, lib, settings, ... }:

{
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

  # home-manager.users.${settings.userName}.home.file.".config/mpd/mpd.conf".text = ''
  #   bind_to_address "localhost"
  #   port "6600"
  #   music_directory "/home/${settings.userName}/Music"
  #   audio_output {
  #     type "pipewire"
  #     name "My PipeWire Output"
  #   } 
  # '';

  systemd = {
    services = {
      mpd.environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
      };
    };
  };
}