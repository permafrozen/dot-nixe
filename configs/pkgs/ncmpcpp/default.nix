{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.ncmpcpp = {
      enable = true;
      mpdMusicDir = "/home/${settings.userName}/Music";
      settings = {
        mpd_host = "localhost";
        mpd_port = "6600";
        visualizer_data_source = "/tmp/mpd.fifo";
        visualizer_output_name = "my_fifo";
        visualizer_in_stereo = "yes";
        visualizer_type = "ellipse";
        visualizer_look = "+|";
      };
    };
  };
}
