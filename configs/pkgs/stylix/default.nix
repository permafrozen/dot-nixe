{ config, pkgs, lib, settings, ... }:

let

  mcmojave-hypr = builtins.fetchGit {
    url = "https://github.com/OtaK/McMojave-hyprcursor.git";
    ref = "main";
    rev = "7ed49d93f7c56df81d085fa8f70c4129956884b2";
  };

  mcmojave = builtins.fetchGit {
    url = "https://github.com/vinceliuice/McMojave-cursors.git";
    ref = "main";
    rev = "7d0bfc1f91028191cdc220b87fd335a235ee4439";
  };

  mcmojave-cursor = pkgs.stdenv.mkDerivation {
    pname = "mcmojave-cursor";
    version = "1.0.0";
    src = mcmojave;
    installPhase = ''
      mkdir -p $out/share/icons
      cp -r dist $out/share/icons/McMojave
    '';
  };

  stylixConfig = {
    enable = true;
    autoEnable = false;
    image = ../../../assets/wallpapers/${settings.wallpaper};
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/${settings.scheme}.yaml";
    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.nerd-fonts.hack;
      };
      emoji = {
        name = "Noto Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 14;
      };
    };
    cursor = {
      package = mcmojave-cursor;
      name = "${settings.cursor}";
      size = 24;
    };
  };

in {
  stylix = stylixConfig // { targets = { regreet.enable = true; }; };

  environment.systemPackages = with pkgs; [
    base16-schemes
    bibata-cursors
    adwaita-icon-theme
    gnome-icon-theme
    hicolor-icon-theme
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.symbols-only
    maple-mono.NF
    noto-fonts-emoji
    fira-code-symbols
  ];

  home-manager.users.${settings.userName} = {
    # Cursor Deployment
    home.file.".icons/Bibata-Modern-Classic".source =
      "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

    home.file.".local/share/icons/McMojave-Hypr".source = builtins.path {
      name = "McMojave-Hypr";
      path = "${mcmojave-hypr}/dist";
    };

    # Icon themes
    gtk = {
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
    };

    stylix = stylixConfig // {
      targets = {
        gtk.enable = true;
        btop.enable = true;
        bat.enable = true;
        foot.enable = true;
        gnome.enable = true;
        kde.enable = true;
        vscode.enable = true;
        yazi.enable = true;
        zathura.enable = true;
        zellij.enable = true;
        firefox.enable = true;
        lazygit.enable = true;
      };
    };

    # Fish
    programs.fish = {
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
        set -U fish_pager_color_selected_background --background=${config.lib.stylix.colors.base02}
        set -U fish_pager_color_secondary_description ${config.lib.stylix.colors.base04}
        set -U fish_pager_color_secondary_background ${config.lib.stylix.colors.base02}
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

    # Starship
    programs.starship = {
      settings = {
        palettes.custom = {
          black = "#${config.lib.stylix.colors.base03}";
          white = "#${config.lib.stylix.colors.base05}";
          red = "#${config.lib.stylix.colors.base08}";
          green = "#${config.lib.stylix.colors.base0B}";
          blue = "#${config.lib.stylix.colors.base0B}";
          cyan = "#${config.lib.stylix.colors.base0D}";
          yellow = "#${config.lib.stylix.colors.base0A}";
        };
      };
    };

    # Zellij Stylix Config
    programs.zellij = {
      settings = {
        themes.stylix.green = lib.mkForce "#${config.lib.stylix.colors.base05}";
      };
    };

    # Vscode Stylix Config
    programs.vscode = {
      profiles.default.userSettings = {
        "workbench.list.smoothScrolling" = "true";
        "workbench.colorCustomizations" = {
          "[Stylix]" = {
            "sideBar.background" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "activityBar.background" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "tab.inactiveBackground" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "editorGroupHeader.tabsBackground" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "tree.indentGuidesStroke" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "statusBar.background" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "editorTitle.background" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "statusBarItem.remoteBackground" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "dropdown.listBackground" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "titleBar.inactiveBackground" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "breadcrumb.background" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
            "sideBarSectionHeader.background" =
              lib.mkForce "#${config.lib.stylix.colors.base00}";
          };
        };
      };
    };
  };
}
