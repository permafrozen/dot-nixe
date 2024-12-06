{ settings, ... }:

{
  home-manager.users.${settings.userName} = {
    programs.starship = {
      enable = true;
      settings = {

        # Misc
        # format = ''
        #   $directory$character
        # '';
        palette = "custom";
        add_newline = false;

        # Prompt Character
        character = {
          success_symbol = "[ > ](bold white)";
          error_symbol = "[!> ](bold red)";
        };

        # Directory Module
        directory = {
          format = "[$path]($style)[$read_only]($read_only_style) ";
          home_symbol = "~";
          truncation_length = 5;
          read_only = "";
          read_only_style = "red";
        };

        # Shell Module
        # shell = {
        #   fish_indicator = "fsh";
        #   bash_indicator = "bsh";
        #   zsh_indicator = "zsh";
        #   unknown_indicator = "?  ";
        #   style = "yellow bold";
        #   disabled = true;
        # };

        # Nix-Shell Module
        # nix_shell = {
        #   format = "via [󰜗 $state( ($name))](bold blue) ";
        #   impure_msg = "[impure](bold red)";
        #   pure_msg = "[pure](bold green)";
        #   unknown_msg = "[unknown shell](bold yellow)";
        # };
      };

      # Shell Integration
      enableFishIntegration = true;
    };
  };
}
