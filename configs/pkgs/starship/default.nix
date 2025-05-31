{ settings, ... }:
{
  home-manager.users.${settings.userName} = {
    programs.starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        add_newline = false;
        character = {
          error_symbol = "[>](bold red)";
          format = "$symbol ";
          success_symbol = "[>](bold)";
        };
        directory = {
          fish_style_pwd_dir_length = 1;
          format = "[$path]($style)[$read_only]($read_only_style) ";
          read_only = " ";
          read_only_style = "red";
          style = "bold path";
        };
        format = "$username$hostname$directory$all$character";
        git_branch = {
          format = "[on](italic) [$symbol$branch(:$remote_branch)]($style) ";
          style = "bold information";
        };
        git_status = {
          format = "([\\[$all_status$ahead_behind\\]]($style) )";
          modified = "!$count";
          style = "bold status";
        };
        hostname = {
          format = "[$ssh_symbol$hostname]($style) [in](italic) ";
          ssh_only = false;
          style = "bold username";
        };
        line_break = {
          disabled = true;
        };
        palette = "custom";
        palettes = {
          custom = {
            information = "purple";
            path = "blue";
            status = "red";
            username = "cyan";
          };
        };
        username = {
          format = "[$user@]($style)";
          show_always = true;
          style_root = "red bold";
          style_user = "bold username";
        };
      };
    };
  };
}
