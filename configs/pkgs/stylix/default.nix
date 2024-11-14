{ config, pkgs, lib, settings, ... }:

let
  stylixConfig = {
    enable = true;
    autoEnable = false;
    image = ../../../assets/wallpapers/${settings.wallpaper};
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/${settings.scheme}.yaml";
    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = {
        name = "Noto Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      monospace = {
        name = "Hack Nerd Font";
        package = pkgs.nerdfonts;
      };
    };
  };
in {
  stylix = stylixConfig // { targets = { console.enable = true; }; };

  home-manager.users.${settings.userName} = {
    stylix = stylixConfig // {
      targets = {
        gtk.enable = true;
        btop.enable = true;
        bat.enable = true;
        gnome.enable = true;
        kde.enable = true;
        vscode.enable = true;
        yazi.enable = true;
        zellij.enable = true;
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
          white = "#${config.lib.stylix.colors.base0D}";
          red = "#${config.lib.stylix.colors.base08}";
          green = "#${config.lib.stylix.colors.base0B}";
          blue = "#${config.lib.stylix.colors.base0B}";
          cyan = "#${config.lib.stylix.colors.base0C}";
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
      userSettings = {
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

    # Zed Stylix Config
    home.file.".config/zed/settings.json".text = ''
      {
        "ui_font_size": 16,
        "buffer_font_size": 16,
        "theme": {
          "mode": "system",
          "light": "base16",
          "dark": "base16"
        }
      }
    '';
    home.file.".config/zed/themes/base16.json".text = ''
      {
        "$schema": "https://zed.dev/schema/themes/v0.1.0.json",
        "author": "Matteo",
        "name": "base16",
        "themes": [
          {
            "appearance": "dark",
            "name": "base16",
            "style": {
              "accents": [
                "#${config.lib.stylix.colors.base0D}",
                "#${config.lib.stylix.colors.base0A}",
                "#${config.lib.stylix.colors.base0E}",
                "#${config.lib.stylix.colors.base0C}",
                "#${config.lib.stylix.colors.base08}",
                "#${config.lib.stylix.colors.base0B}",
                "#${config.lib.stylix.colors.base0A}"
              ],
              "background": "#${config.lib.stylix.colors.base00}",
              "border": "#${config.lib.stylix.colors.base00}",
              "border.disabled": "#${config.lib.stylix.colors.base01}",
              "border.focused": "#${config.lib.stylix.colors.base03}",
              "border.selected": "#${config.lib.stylix.colors.base04}",
              "border.transparent": "#${config.lib.stylix.colors.base01}",
              "border.variant": "#${config.lib.stylix.colors.base00}",
              "conflict": "#${config.lib.stylix.colors.base09}",
              "created": "#${config.lib.stylix.colors.base0B}",
              "deleted": "#${config.lib.stylix.colors.base01}",
              "drop_target.background": "#${config.lib.stylix.colors.base00}",
              "editor.active_line.background": "#${config.lib.stylix.colors.base01}",
              "editor.active_line_number": "#${config.lib.stylix.colors.base0A}",
              "editor.active_wrap_guide": "#${config.lib.stylix.colors.base01}",
              "editor.background": "#${config.lib.stylix.colors.base01}",
              "editor.foreground": "#${config.lib.stylix.colors.base05}",
              "editor.gutter.background": "#${config.lib.stylix.colors.base01}",
              "editor.indent_guide": "#${config.lib.stylix.colors.base01}",
              "editor.indent_guide_active": "#${config.lib.stylix.colors.base04}",
              "editor.line_number": "#${config.lib.stylix.colors.base03}",
              "editor.wrap_guide": "#${config.lib.stylix.colors.base01}",
              "element.active": "#${config.lib.stylix.colors.base09}99",
              "element.background": "#${config.lib.stylix.colors.base03}",
              "element.hover": "#${config.lib.stylix.colors.base09}4C",
              "element.selected": "#${config.lib.stylix.colors.base09}33",
              "elevated_surface.background": "#${config.lib.stylix.colors.base00}",
              "error": "#${config.lib.stylix.colors.base08}",
              "error.background": "#${config.lib.stylix.colors.base01}",
              "ghost_element.active": "#${config.lib.stylix.colors.base09}66",
              "ghost_element.hover": "#${config.lib.stylix.colors.base03}66",
              "ghost_element.selected": "#${config.lib.stylix.colors.base03}",
              "hidden": "#${config.lib.stylix.colors.base03}",
              "hint": "#${config.lib.stylix.colors.base03}",
              "hint.background": "#${config.lib.stylix.colors.base01}",
              "icon": "#${config.lib.stylix.colors.base08}",
              "icon.accent": "#${config.lib.stylix.colors.base0C}",
              "icon.disabled": "#${config.lib.stylix.colors.base0D}",
              "icon.muted": "#${config.lib.stylix.colors.base0B}",
              "icon.placeholder": "#${config.lib.stylix.colors.base0A}",
              "ignored": "#${config.lib.stylix.colors.base03}",
              "info": "#${config.lib.stylix.colors.base0D}",
              "info.background": "#${config.lib.stylix.colors.base03}",
              "link_text.hover": "#${config.lib.stylix.colors.base0C}",
              "modified": "#${config.lib.stylix.colors.base0A}",
              "panel.background": "#${config.lib.stylix.colors.base00}",
              "players": [
                {
                  "background": "#${config.lib.stylix.colors.base0B}",
                  "cursor": "#${config.lib.stylix.colors.base0B}",
                  "selection": "#${config.lib.stylix.colors.base0B}3D"
                }
              ],
              "predictive": "#${config.lib.stylix.colors.base03}",
              "renamed": "#${config.lib.stylix.colors.base0A}",
              "scrollbar.thumb.border": "#${config.lib.stylix.colors.base02}",
              "scrollbar.thumb.hover_background": "#${config.lib.stylix.colors.base03}",
              "scrollbar.track.background": "#${config.lib.stylix.colors.base01}",
              "scrollbar.track.border": "#${config.lib.stylix.colors.base00}",
              "scrollbar_thumb.background": "#${config.lib.stylix.colors.base02}",
              "search.match_background": "#${config.lib.stylix.colors.base04}",
              "status_bar.background": "#${config.lib.stylix.colors.base00}",
              "success": "#${config.lib.stylix.colors.base0B}",
              "success.background": "#${config.lib.stylix.colors.base01}",
              "surface.background": "#${config.lib.stylix.colors.base00}",
              "syntax": {
                "boolean": {
                  "color": "#${config.lib.stylix.colors.base09}"
                },
                "comment": {
                  "color": "#${config.lib.stylix.colors.base03}"
                },
                "comment.doc": {
                  "color": "#${config.lib.stylix.colors.base03}"
                },
                "constant": {
                  "color": "#${config.lib.stylix.colors.base09}"
                },
                "constructor": {
                  "color": "#${config.lib.stylix.colors.base09}"
                },
                "function": {
                  "color": "#${config.lib.stylix.colors.base0D}"
                },
                "keyword": {
                  "color": "#${config.lib.stylix.colors.base0E}"
                },
                "number": {
                  "color": "#${config.lib.stylix.colors.base09}"
                },
                "operator": {
                  "color": "#${config.lib.stylix.colors.base05}"
                },
                "preproc": {
                  "color": "#${config.lib.stylix.colors.base0E}"
                },
                "property": {
                  "color": "#${config.lib.stylix.colors.base0D}"
                },
                "punctuation": {
                  "color": "#${config.lib.stylix.colors.base05}"
                },
                "punctuation.bracket": {
                  "color": "#${config.lib.stylix.colors.base05}"
                },
                "punctuation.delimiter": {
                  "color": "#${config.lib.stylix.colors.base05}"
                },
                "punctuation.list_marker": {
                  "color": "#${config.lib.stylix.colors.base05}"
                },
                "punctuation.special": {
                  "color": "#${config.lib.stylix.colors.base05}"
                },
                "string": {
                  "color": "#${config.lib.stylix.colors.base0B}"
                },
                "string.escape": {
                  "color": "#${config.lib.stylix.colors.base0B}"
                },
                "string.regex": {
                  "color": "#${config.lib.stylix.colors.base0A}"
                },
                "string.special": {
                  "color": "#${config.lib.stylix.colors.base0C}"
                },
                "string.special.symbol": {
                  "color": "#${config.lib.stylix.colors.base08}"
                },
                "tag": {
                  "color": "#${config.lib.stylix.colors.base0E}"
                },
                "text.literal": {
                  "color": "#${config.lib.stylix.colors.base0B}"
                },
                "type": {
                  "color": "#${config.lib.stylix.colors.base0A}"
                },
                "variable": {
                  "color": "#${config.lib.stylix.colors.base0C}"
                },
                "variable.special": {
                  "color": "#${config.lib.stylix.colors.base08}"
                }
              },
              "tab.active_background": "#${config.lib.stylix.colors.base01}",
              "tab.inactive_background": "#${config.lib.stylix.colors.base00}",
              "tab_bar.background": "#${config.lib.stylix.colors.base00}",
              "terminal.ansi.black": "#${config.lib.stylix.colors.base02}",
              "terminal.ansi.blue": "#${config.lib.stylix.colors.base0D}",
              "terminal.ansi.bright_black": "#${config.lib.stylix.colors.base03}",
              "terminal.ansi.bright_blue": "#${config.lib.stylix.colors.base0D}",
              "terminal.ansi.bright_cyan": "#${config.lib.stylix.colors.base0C}",
              "terminal.ansi.bright_green": "#${config.lib.stylix.colors.base0B}",
              "terminal.ansi.bright_magenta": "#${config.lib.stylix.colors.base0E}",
              "terminal.ansi.bright_red": "#${config.lib.stylix.colors.base08}",
              "terminal.ansi.white": "#${config.lib.stylix.colors.base07}",
              "terminal.ansi.yellow": "#${config.lib.stylix.colors.base09}",
              "terminal.background": "#${config.lib.stylix.colors.base00}",
              "terminal.bright_foreground": "#${config.lib.stylix.colors.base05}",
              "terminal.dim_foreground": "#${config.lib.stylix.colors.base04}",
              "terminal.foreground": "#${config.lib.stylix.colors.base06}",
              "text": "#${config.lib.stylix.colors.base05}",
              "text.accent": "#${config.lib.stylix.colors.base04}",
              "text.disabled": "#${config.lib.stylix.colors.base03}",
              "text.muted": "#${config.lib.stylix.colors.base06}",
              "text.placeholder": "#${config.lib.stylix.colors.base03}",
              "title_bar.background": "#${config.lib.stylix.colors.base00}",
              "toolbar.background": "#${config.lib.stylix.colors.base00}",
              "warning": "#${config.lib.stylix.colors.base09}",
              "warning.background": "#${config.lib.stylix.colors.base02}"
            }
          }
        ]
      }
    '';
  };

  environment.systemPackages = with pkgs; [ base16-schemes ];

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
  ];
}
