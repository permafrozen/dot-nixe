{ pkgs, settings, ... }:

{
  environment.systemPackages = [ pkgs.devenv ];

  home-manager.users.${settings.userName} = {
    programs = {
      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };

      fzf = {
        enable = true;
        enableFishIntegration = true;
      };

      yazi = {
        enable = true;
        enableFishIntegration = true;
      };

      direnv = {
        enable = true;
        silent = true;
      };

      # Fish Configuration
      fish = {
        enable = true;
        functions = {
          __fish_command_not_found_handler = {
            body = "__fish_default_command_not_found_handler $argv[1]";
            onEvent = "fish_command_not_found";
          };
        };
        shellAliases = {
          ls = "eza";
          cd = "z";
          edi = "zeditor ./";
          nos = "rm -f ~/.zen/default/search.json.mozlz4.backup && nh os switch .";
          dev = " nix develop --command fish";
          fym = "yt-dlp -f bestaudio --extract-audio --audio-format mp3";
        };
        shellInit = ''
          fish_default_key_bindings
          set -U fish_greeting
          direnv hook fish | source
        '';
      };
    };
  };

  # Fish as Default Shell
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

}
