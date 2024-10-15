{ config, pkgs, settings, ... }:

{
  environment.systemPackages = [
    mpd
  ];

  home-manager.users.${settings.userName} = {
    services.mpd = {
      enable = true;
      extraConfig = ''
        bind_to_address "127.0.0.1"
        #bind_to_address "~/.mpd/socket"
        music_directory "~/Music"
        playlist_directory "~/.mpd/playlists"   
        db_file      "~/.mpd/mpd.db"  
        log_file      "~/.mpd/mpd.log"  
        pid_file      "~/.mpd/mpd.pid"  
        state_file     "~/.mpd/mpdstate"  

        audio_output {  
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
        }  
      '';
    };
  };
}