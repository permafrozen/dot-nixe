{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          format = "[ ](white)";
          success_symbol = "[ ](bold green)";
          error_symbol = "[ ](bold red)";
        };
      };
      enableFishIntegration = true;
    };
  };
}
