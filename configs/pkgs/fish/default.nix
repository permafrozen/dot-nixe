{ pkgs, settings, ... }:

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
          eta = "eza -T";
          le = "eza";
          nrf = "nh os switch .";
          trel = "tre -l 1";
          clearfetch = "clear && fastfetch";
          ttt = "tt -notheme";
          matrix = "cmatrix -s -C blue";
        };
        shellInit = ''
          fish_default_key_bindings
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
    # Hardcore Sigma grinding software
    acpi
    bat
    curl
    eza
    file
    git
    nurl
    nix-output-monitor
    tre-command
    tree
    vim
    wget
    mdbook
    zip

    # Silly gimick stuff
    cowsay
    figlet
    fortune
    lolcat
    jp2a
    cmatrix
    tt
  ];
}
