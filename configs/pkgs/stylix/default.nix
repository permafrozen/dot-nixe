{ config, pkgs, lib, settings, ...}:

let 
  stylixConfig = {
    enable = true;
    autoEnable = false;
    image = ../../../assets/wallpapers/${settings.wallpaper};
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${settings.scheme}.yaml";
    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = {
        name = "Noto Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      monospace= {
        name = "Hack Nerd Font";
        package = pkgs.nerdfonts;
      };
    };
  };
in {
  stylix = stylixConfig;

  home-manager.users.${settings.userName} = {
    stylix = stylixConfig // {
      targets = {
        gtk.enable = true;
        gnome.enable = true;
        kde.enable = true;
        vscode.enable = true;
      };
    };

    # Stylix Fish Config
    programs = {
      fish = {
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
        '';
      };
    };

    # Vscode Stylix Config
    programs.vscode = {
      userSettings = {
        "workbench.list.smoothScrolling"= "true";
        "workbench.colorCustomizations" = {
          "[Stylix]" = {
            "sideBar.background"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "activityBar.background"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "tab.inactiveBackground"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "editorGroupHeader.tabsBackground"= lib.mkForce "#${config.lib.stylix.colors.base00}";
            "tree.indentGuidesStroke" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "statusBar.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "editorTitle.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "statusBarItem.remoteBackground" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "dropdown.listBackground" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "titleBar.inactiveBackground" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "breadcrumb.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
            "sideBarSectionHeader.background" = lib.mkForce "#${config.lib.stylix.colors.base00}";
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    base16-schemes
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];
}
