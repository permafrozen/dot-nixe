{ config, pkgs, lib, settings, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/${settings.userName}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  home-manager.users.${settings.userName} = {
    home.file."Music/README.md".text = '' Here belongs the Music for mpd'';
  };
}