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
      bindings = [
        {
          key = "j";
          command = "scroll_down";
        }

        {
          key = "k";
          command = "scroll_up";
        }

        {
          key = "h";
          command = "previous_column";
        }

        {
          key = "l";
          command = "next_column";
        }

        {
          key = "ctrl-b";
          command = "page_up";
        }

        {
          key = "ctrl-u";
          command = "page_up";
        }

        {
          key = "ctrl-f";
          command = "page_down";
        }

        {
          key = "ctrl-d";
          command = "page_down";
        }

        {
          key = "g";
          command = "move_home";
        }

        {
          key = "G";
          command = "move_end";
        }

        {
          key = "n";
          command = "next_found_item";
        }

        {
          key = "N";
          command = "previous_found_item";
        }
      ];
    };
  };
}
