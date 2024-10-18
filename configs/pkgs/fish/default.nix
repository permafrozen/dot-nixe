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
          set -U fish_color_normal normal
          set -U fish_color_command ${config.lib.stylix.colors.base0B}
          set -U fish_color_quote ${config.lib.stylix.colors.base0A}
          set -U fish_color_redirection ${config.lib.stylix.colors.base06}
          set -U fish_color_end ${config.lib.stylix.colors.base0E}
          set -U fish_color_error ${config.lib.stylix.colors.base08}
          set -U fish_color_param ${config.lib.stylix.colors.base06}
          set -U fish_color_comment ${config.lib.stylix.colors.base0A}
          set -U fish_color_match ${config.lib.stylix.colors.base0D}
          set -U fish_color_selection ${config.lib.stylix.colors.base07} --bold 
          set -U fish_color_search_match ${config.lib.stylix.colors.base0B} --bold 
          set -U fish_color_history_current --bold
          set -U fish_color_operator ${config.lib.stylix.colors.base0D}
          set -U fish_color_escape ${config.lib.stylix.colors.base0C}
          set -U fish_color_cwd ${config.lib.stylix.colors.base0B}
          set -U fish_color_cwd_root ${config.lib.stylix.colors.base08}
          set -U fish_color_valid_path --underline
          set -U fish_color_autosuggestion ${config.lib.stylix.colors.base04}
          set -U fish_color_user ${config.lib.stylix.colors.base0B}
          set -U fish_color_host ${config.lib.stylix.colors.base05}
          set -U fish_color_cancel --reverse
          set -U fish_pager_color_prefix ${config.lib.stylix.colors.base05} --bold --underline
          set -U fish_pager_color_progress ${config.lib.stylix.colors.base07} --bold
          set -U fish_pager_color_completion ${config.lib.stylix.colors.base05}
          set -U fish_pager_color_description ${config.lib.stylix.colors.base0D}
          set -U fish_pager_color_selected_background --background=${config.lib.stylix.colors.base00}
          set -U fish_pager_color_secondary_description ${config.lib.stylix.colors.base04}
          set -U fish_pager_color_secondary_background ${config.lib.stylix.colors.base01}
          set -U fish_color_option ${config.lib.stylix.colors.base0E}
          set -U fish_pager_color_background ${config.lib.stylix.colors.base00}
          set -U fish_pager_color_secondary_completion ${config.lib.stylix.colors.base05}
          set -U fish_pager_color_selected_completion ${config.lib.stylix.colors.base05}
          set -U fish_pager_color_selected_prefix ${config.lib.stylix.colors.base0B}
          set -U fish_color_host_remote ${config.lib.stylix.colors.base09}
          set -U fish_color_keyword ${config.lib.stylix.colors.base0E}
          set -U fish_pager_color_selected_description ${config.lib.stylix.colors.base0A}
          set -U fish_pager_color_secondary_prefix ${config.lib.stylix.colors.base06}
          set -U fish_greeting
          cd
        '';
      };
      kitty = {
        extraConfig = ''
          shell fish
        '';
        shellIntegration.enableFishIntegration = true;
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
    sl
    tree
    vim
    wget
    tt
  ];
}
