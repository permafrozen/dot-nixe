{ config, pkgs, settings, ...}:

{
  home-manager.users.${settings.userName} = {
    programs = {
      fish = {
        enable = true;
        functions = {
          __fish_command_not_found_handler = {
            body = "__fish_default_command_not_found_handler $argv[1]";
            onEvent = "fish_command_not_found";
          };
        };
        shellAliases = {
          tt = "tt -notheme";
          train = "sl -e";
          bonsai = "cbonsai -S";
          matrix = "cmatrix -s";
        };
        shellInit = ''
          set -U fish_greeting
          cd
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

  environment.systemPackages = with pkgs; [
    acpi
    bat
    cbonsai
    cmatrix
    git
    nurl
    nix-output-monitor
    sl
    tree
    vim
    wget
    tt
  ];
}
