{ config, pkgs, settings, ... }:

{
  services.mpd = {
    enable = true;
    # musicDirectory = "/home/${settings.userName}/Music"; # Without this everything is located in /var/lib/mpd/
    extraConfig = ''
      audio_output {
          type    "pipewire"
          name    "PipeWire Sound Server"
          mixer_type "software"
        }

      audio_output {
          type                    "fifo"
          name                    "my_fifo"
          path                    "/tmp/mpd.fifo"
          format                  "44100:16:2"
      }  
    '';
  };
}