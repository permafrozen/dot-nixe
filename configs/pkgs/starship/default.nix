{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.starship = {
      enable = true;
      settings = {

        # Misc
        format = ''
          $directory$all$character
        '';

        palette = "custom";
        add_newline = false;

        # Prompt Character
        character = {
          success_symbol = "[  ](bold white)";
          error_symbol = "[  ](bold red)";
        };

        # Directory Module
        directory = {
          format = "[$path]($style)[$read_only]($read_only_style) ";
          home_symbol = "~";
          truncation_length = 5;
          read_only = "";
          read_only_style = "red";
        };
      };
    };
  };
}
