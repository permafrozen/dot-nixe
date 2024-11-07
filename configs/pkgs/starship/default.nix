{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.starship = {
      enable = true;
      settings = {
        palette = "custom";
        add_newline = true;
        character = {
          format = "[ ](white)";
          success_symbol = "[ ](bold green)";
          error_symbol = "[ ](bold red)";
        };
        directory = {
          format = "[$path]($style)[$read_only]($read_only_style) ";
          home_symbol = "󰜥";
          truncation_length = 5;
          read_only = "";
          read_only_style = "red";
        };
      };
      enableFishIntegration = true;
    };
  };
}
