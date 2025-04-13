{ config, settings, dotlib, ... }: {

  home-manager.users.${settings.userName} = {
    home.file.".config/zed/themes/stylix.json".text = ''
      {
        "$schema": "https://zed.dev/schema/themes/v0.1.0.json",
        "name": "Base16 Stylix",
        "author": "Permafrozen",
        "themes": [
          {
            "name": "Base16 Stylix",
            "appearance": "dark",
            "style": {
              "border": "#00000000",
              "border.variant": "#00000000",
              "border.focused": "#00000000",
              "border.selected": "#00000000",
              "border.transparent": "#00000000",
              "border.disabled": "#00000000",

              "background.appearance": "blurred",
              "background": "#${config.lib.stylix.colors.base00}${
                dotlib.decToHex settings.opacity
              }",
              "title_bar.background": "#${config.lib.stylix.colors.base00}${
                dotlib.decToHex settings.opacity
              }",
              "title_bar.inactive_background": "#${config.lib.stylix.colors.base00}${
                dotlib.decToHex settings.opacity
              }",
              "status_bar.background": "#${config.lib.stylix.colors.base00}${
                dotlib.decToHex settings.opacity
              }",

              "panel.background": "#${config.lib.stylix.colors.base00}00",
              "editor.background": "#${config.lib.stylix.colors.base00}00",
              "tab_bar.background": "#${config.lib.stylix.colors.base00}00",
              "terminal.background": "#${config.lib.stylix.colors.base00}00",
              "toolbar.background": "#${config.lib.stylix.colors.base00}00",
              "tab.inactive_background": "#${config.lib.stylix.colors.base00}00",
              "tab.active_background": "#${config.lib.stylix.colors.base02}4d",
              "element.selected": "#${config.lib.stylix.colors.base02}4d",

              "scrollbar.show": "never",
              "scrollbar.thumb.background": "#${config.lib.stylix.colors.base02}00",
              "scrollbar.thumb.hover_background": "#${config.lib.stylix.colors.base03}00",
              "scrollbar.thumb.border": "#${config.lib.stylix.colors.base02}00",
              "scrollbar.track.background": "#${config.lib.stylix.colors.base00}00",
              "scrollbar.track.border": "#00000000",

              "elevated_surface.background": "#${config.lib.stylix.colors.base00}ff",
              "surface.background": "#${config.lib.stylix.colors.base00}00",
              "editor.active_line.background": "#${config.lib.stylix.colors.base01}00",
              "editor.gutter.background": "#${config.lib.stylix.colors.base00}00",
              "editor.line_number": "#${config.lib.stylix.colors.base04}ff",
              "editor.active_line_number": "#${config.lib.stylix.colors.base05}ff",


              "element.background": "#${config.lib.stylix.colors.base01}",
              "element.hover": "#${config.lib.stylix.colors.base02}",
              "element.active": null,
              "element.disabled": null,
              "drop_target.background": "#${config.lib.stylix.colors.base02}",
              "ghost_element.background": null,
              "ghost_element.hover": "#${config.lib.stylix.colors.base01}",
              "ghost_element.active": null,
              "ghost_element.selected": "#${config.lib.stylix.colors.base02}",
              "ghost_element.disabled": null,
              "text": "#${config.lib.stylix.colors.base05}",
              "text.muted": "#${config.lib.stylix.colors.base04}",
              "text.placeholder": "#${config.lib.stylix.colors.base07}",
              "text.disabled": "#${config.lib.stylix.colors.base02}",
              "text.accent": "#${config.lib.stylix.colors.base0C}",
              "icon": null,
              "icon.muted": null,
              "icon.disabled": null,
              "icon.placeholder": null,
              "icon.accent": null,
              "search.match_background": "#${config.lib.stylix.colors.base02}",
              "panel.focused_border": "#${config.lib.stylix.colors.base02}",
              "pane.focused_border": null,
              "editor.foreground": "#${config.lib.stylix.colors.base05}",
              "editor.subheader.background": "#${config.lib.stylix.colors.base00}",
              "editor.highlighted_line.background": null,
              "editor.invisible": null,
              "editor.wrap_guide": "#${config.lib.stylix.colors.base01}",
              "editor.active_wrap_guide": "#${config.lib.stylix.colors.base03}",
              "editor.document_highlight.read_background": "#${config.lib.stylix.colors.base01}",
              "editor.document_highlight.write_background": "#${config.lib.stylix.colors.base01}",
              "terminal.foreground": null,
              "terminal.bright_foreground": null,
              "terminal.dim_foreground": null,
              "terminal.ansi.black": "#${config.lib.stylix.colors.base00}",
              "terminal.ansi.bright_black": "#${config.lib.stylix.colors.base03}",
              "terminal.ansi.dim_black": null,
              "terminal.ansi.red": "#${config.lib.stylix.colors.base08}",
              "terminal.ansi.bright_red": "#${config.lib.stylix.colors.base08}",
              "terminal.ansi.dim_red": null,
              "terminal.ansi.green": "#${config.lib.stylix.colors.base0B}",
              "terminal.ansi.bright_green": "#${config.lib.stylix.colors.base0B}",
              "terminal.ansi.dim_green": null,
              "terminal.ansi.yellow": "#${config.lib.stylix.colors.base0A}",
              "terminal.ansi.bright_yellow": "#${config.lib.stylix.colors.base0A}",
              "terminal.ansi.dim_yellow": null,
              "terminal.ansi.blue": "#${config.lib.stylix.colors.base0D}",
              "terminal.ansi.bright_blue": "#${config.lib.stylix.colors.base0D}",
              "terminal.ansi.dim_blue": null,
              "terminal.ansi.magenta": "#${config.lib.stylix.colors.base0E}",
              "terminal.ansi.bright_magenta": "#${config.lib.stylix.colors.base0E}",
              "terminal.ansi.dim_magenta": null,
              "terminal.ansi.cyan": "#${config.lib.stylix.colors.base0C}",
              "terminal.ansi.bright_cyan": "#${config.lib.stylix.colors.base0C}",
              "terminal.ansi.dim_cyan": null,
              "terminal.ansi.white": "#${config.lib.stylix.colors.base05}",
              "terminal.ansi.bright_white": "#${config.lib.stylix.colors.base07}",
              "terminal.ansi.dim_white": null,
              "link_text.hover": "#${config.lib.stylix.colors.base0C}",
              "conflict": "#${config.lib.stylix.colors.base0A}",
              "conflict.background": "#${config.lib.stylix.colors.base00}",
              "conflict.border": "#${config.lib.stylix.colors.base0A}",
              "created": "#${config.lib.stylix.colors.base0B}",
              "created.background": "#${config.lib.stylix.colors.base00}",
              "created.border": "#${config.lib.stylix.colors.base0B}",
              "deleted": "#${config.lib.stylix.colors.base08}",
              "deleted.background": "#${config.lib.stylix.colors.base00}",
              "deleted.border": "#${config.lib.stylix.colors.base08}",
              "error": "#${config.lib.stylix.colors.base08}",
              "error.background": "#${config.lib.stylix.colors.base00}",
              "error.border": "#${config.lib.stylix.colors.base08}",
              "hidden": "#${config.lib.stylix.colors.base03}",
              "hidden.background": "#${config.lib.stylix.colors.base00}",
              "hidden.border": "#${config.lib.stylix.colors.base03}",
              "hint": "#${config.lib.stylix.colors.base05}",
              "hint.background": "#${config.lib.stylix.colors.base00}",
              "hint.border": "#${config.lib.stylix.colors.base0C}",
              "ignored": "#${config.lib.stylix.colors.base03}",
              "ignored.background": "#${config.lib.stylix.colors.base00}",
              "ignored.border": "#${config.lib.stylix.colors.base03}",
              "info": "#${config.lib.stylix.colors.base0C}",
              "info.background": "#${config.lib.stylix.colors.base00}",
              "info.border": "#${config.lib.stylix.colors.base0C}",
              "modified": "#${config.lib.stylix.colors.base0D}",
              "modified.background": "#${config.lib.stylix.colors.base00}",
              "modified.border": "#${config.lib.stylix.colors.base0D}",
              "predictive": "#${config.lib.stylix.colors.base03}",
              "predictive.background": "#${config.lib.stylix.colors.base01}",
              "predictive.border": "#${config.lib.stylix.colors.base02}",
              "renamed": "#${config.lib.stylix.colors.base0A}",
              "renamed.background": "#${config.lib.stylix.colors.base00}",
              "renamed.border": "#${config.lib.stylix.colors.base0A}",
              "success": "#${config.lib.stylix.colors.base0B}",
              "success.background": "#${config.lib.stylix.colors.base00}",
              "success.border": "#${config.lib.stylix.colors.base0B}",
              "unreachable": "#${config.lib.stylix.colors.base0A}",
              "unreachable.background": "#${config.lib.stylix.colors.base00}",
              "unreachable.border": "#${config.lib.stylix.colors.base0A}",
              "warning": "#${config.lib.stylix.colors.base0A}",
              "warning.background": "#${config.lib.stylix.colors.base00}",
              "warning.border": "#${config.lib.stylix.colors.base0A}",
              "players": [
                {
                  "cursor": "#${config.lib.stylix.colors.base05}",
                  "selection": "#${config.lib.stylix.colors.base02}",
                  "background": null
                }
              ],
              "syntax": {
                "attribute": {
                  "color": "#${config.lib.stylix.colors.base0D}",
                  "font_style": null,
                  "font_weight": null
                },
                "boolean": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "comment": {
                  "color": "#${config.lib.stylix.colors.base03}",
                  "font_style": "italic",
                  "font_weight": null
                },
                "comment.doc": {
                  "color": "#${config.lib.stylix.colors.base03}",
                  "font_style": "italic",
                  "font_weight": null
                },
                "constant": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "constructor": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": "italic",
                  "font_weight": null
                },
                "emphasis.strong": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": 700
                },
                "function": {
                  "color": "#${config.lib.stylix.colors.base0D}",
                  "font_style": null,
                  "font_weight": null
                },
                "keyword": {
                  "color": "#${config.lib.stylix.colors.base0E}",
                  "font_style": null,
                  "font_weight": null
                },
                "label": {
                  "color": "#${config.lib.stylix.colors.base0A}",
                  "font_style": null,
                  "font_weight": null
                },
                "link_text": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "link_uri": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "number": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.bracket": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.delimiter": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.list_marker": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.special": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "string": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.escape": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.regex": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special.symbol": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "tag": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "text.literal": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "title": {
                  "color": "#${config.lib.stylix.colors.base0A}",
                  "font_style": null,
                  "font_weight": null
                },
                "type": {
                  "color": "#${config.lib.stylix.colors.base0A}",
                  "font_style": null,
                  "font_weight": null
                },
                "variable": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "variable.special": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": "italic",
                  "font_weight": null
                }
              }
            }
          }
        ]
      }
    '';
  };
}
