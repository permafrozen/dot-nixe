{ config, settings, ... }: {

  home-manager.users.${settings.userName} = {
    home.file.".config/zed/themes/stylix.json".text = ''
      {
        "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
        "name": "Stylix",
        "author": "Permafrozen",
        "themes": [
          {
            "name": "Stylix",
            "appearance": "dark",
            "style": {
              "border": "#${config.lib.stylix.colors.base02}",
              "border.variant": "#${config.lib.stylix.colors.base00}",
              "border.focused": "#${config.lib.stylix.colors.base0D}",
              "border.selected": "#${config.lib.stylix.colors.base0D}",
              "border.transparent": "#00000000",
              "border.disabled": "#${config.lib.stylix.colors.base02}",
              "elevated_surface.background": "#${config.lib.stylix.colors.base00}",
              "surface.background": "#${config.lib.stylix.colors.base00}",
              "background": "#${config.lib.stylix.colors.base00}",
              "element.background": "#${config.lib.stylix.colors.base00}",
              "element.hover": "#${config.lib.stylix.colors.base00}",
              "element.active": "#${config.lib.stylix.colors.base02}",
              "element.selected": "#${config.lib.stylix.colors.base02}",
              "element.disabled": "#${config.lib.stylix.colors.base00}",
              "drop_target.background": "#${config.lib.stylix.colors.base02}",
              "ghost_element.background": "#00000000",
              "ghost_element.hover": "#${config.lib.stylix.colors.base00}",
              "ghost_element.active": "#${config.lib.stylix.colors.base02}",
              "ghost_element.selected": "#${config.lib.stylix.colors.base02}",
              "ghost_element.disabled": "#${config.lib.stylix.colors.base00}",
              "text": "#${config.lib.stylix.colors.base05}",
              "text.muted": "#${config.lib.stylix.colors.base04}",
              "text.placeholder": "#${config.lib.stylix.colors.base02}",
              "text.disabled": "#${config.lib.stylix.colors.base02}",
              "text.accent": "#${config.lib.stylix.colors.base0C}",
              "icon": "#${config.lib.stylix.colors.base05}",
              "icon.muted": "#${config.lib.stylix.colors.base04}",
              "icon.disabled": "#${config.lib.stylix.colors.base02}",
              "icon.placeholder": "#${config.lib.stylix.colors.base04}",
              "icon.accent": "#${config.lib.stylix.colors.base0C}",
              "status_bar.background": "#${config.lib.stylix.colors.base00}",
              "title_bar.background": "#${config.lib.stylix.colors.base00}",
              "title_bar.inactive_background": "#${config.lib.stylix.colors.base00}",
              "toolbar.background": "#${config.lib.stylix.colors.base00}",
              "tab_bar.background": "#${config.lib.stylix.colors.base00}",
              "tab.inactive_background": "#${config.lib.stylix.colors.base00}",
              "tab.active_background": "#${config.lib.stylix.colors.base00}",
              "search.match_background": "#${config.lib.stylix.colors.base0A}",
              "panel.background": "#${config.lib.stylix.colors.base00}",
              "panel.focused_border": null,
              "pane.focused_border": null,
              "scrollbar.thumb.background": "#${config.lib.stylix.colors.base05}",
              "scrollbar.thumb.hover_background": "#${config.lib.stylix.colors.base00}",
              "scrollbar.thumb.border": "#${config.lib.stylix.colors.base00}",
              "scrollbar.track.background": "#00000000",
              "scrollbar.track.border": "#${config.lib.stylix.colors.base00}",
              "editor.foreground": "#${config.lib.stylix.colors.base05}",
              "editor.background": "#${config.lib.stylix.colors.base00}",
              "editor.gutter.background": "#${config.lib.stylix.colors.base00}",
              "editor.subheader.background": "#${config.lib.stylix.colors.base00}",
              "editor.active_line.background": "#${config.lib.stylix.colors.base00}",
              "editor.highlighted_line.background": "#${config.lib.stylix.colors.base00}",
              "editor.line_number": "#${config.lib.stylix.colors.base04}",
              "editor.active_line_number": "#${config.lib.stylix.colors.base05}",
              "editor.invisible": "#${config.lib.stylix.colors.base02}",
              "editor.wrap_guide": "#${config.lib.stylix.colors.base05}",
              "editor.active_wrap_guide": "#${config.lib.stylix.colors.base05}",
              "editor.document_highlight.read_background": "#${config.lib.stylix.colors.base0C}",
              "editor.document_highlight.write_background": "#${config.lib.stylix.colors.base0F}",
              "terminal.background": "#${config.lib.stylix.colors.base00}",
              "terminal.foreground": "#${config.lib.stylix.colors.base05}",
              "terminal.bright_foreground": "#${config.lib.stylix.colors.base05}",
              "terminal.dim_foreground": "#${config.lib.stylix.colors.base00}",
              "terminal.ansi.black": "#${config.lib.stylix.colors.base00}",
              "terminal.ansi.bright_black": "#${config.lib.stylix.colors.base02}",
              "terminal.ansi.dim_black": "#${config.lib.stylix.colors.base05}",
              "terminal.ansi.red": "#${config.lib.stylix.colors.base08}",
              "terminal.ansi.bright_red": "#${config.lib.stylix.colors.base0F}",
              "terminal.ansi.dim_red": "#${config.lib.stylix.colors.base07}",
              "terminal.ansi.green": "#${config.lib.stylix.colors.base0A}",
              "terminal.ansi.bright_green": "#4d6140ff",
              "terminal.ansi.dim_green": "#${config.lib.stylix.colors.base07}",
              "terminal.ansi.yellow": "#${config.lib.stylix.colors.base09}",
              "terminal.ansi.bright_yellow": "#786441ff",
              "terminal.ansi.dim_yellow": "#${config.lib.stylix.colors.base07}",
              "terminal.ansi.blue": "#${config.lib.stylix.colors.base0C}",
              "terminal.ansi.bright_blue": "#${config.lib.stylix.colors.base0C}",
              "terminal.ansi.dim_blue": "#${config.lib.stylix.colors.base0B}",
              "terminal.ansi.magenta": "#${config.lib.stylix.colors.base08}",
              "terminal.ansi.bright_magenta": "#5e2b26ff",
              "terminal.ansi.dim_magenta": "#${config.lib.stylix.colors.base0E}",
              "terminal.ansi.cyan": "#${config.lib.stylix.colors.base0B}",
              "terminal.ansi.bright_cyan": "#3a565bff",
              "terminal.ansi.dim_cyan": "#b9d9dfff",
              "terminal.ansi.white": "#${config.lib.stylix.colors.base05}",
              "terminal.ansi.bright_white": "#${config.lib.stylix.colors.base05}",
              "terminal.ansi.dim_white": "#575d65ff",
              "link_text.hover": "#${config.lib.stylix.colors.base0C}",
              "conflict": "#${config.lib.stylix.colors.base09}",
              "conflict.background": "#dec1841a",
              "conflict.border": "#5d4c2fff",
              "created": "#${config.lib.stylix.colors.base0A}",
              "created.background": "#a1c1811a",
              "created.border": "#38482fff",
              "deleted": "#${config.lib.stylix.colors.base08}",
              "deleted.background": "#d072771a",
              "deleted.border": "#4c2b2cff",
              "error": "#${config.lib.stylix.colors.base08}",
              "error.background": "#d072771a",
              "error.border": "#4c2b2cff",
              "hidden": "#${config.lib.stylix.colors.base02}",
              "hidden.background": "#${config.lib.stylix.colors.base02}",
              "hidden.border": "#${config.lib.stylix.colors.base02}",
              "hint": "#788ca6ff",
              "hint.background": "#5a6f891a",
              "hint.border": "#${config.lib.stylix.colors.base0D}",
              "ignored": "#${config.lib.stylix.colors.base02}",
              "ignored.background": "#${config.lib.stylix.colors.base02}",
              "ignored.border": "#${config.lib.stylix.colors.base02}",
              "info": "#${config.lib.stylix.colors.base0C}",
              "info.background": "#${config.lib.stylix.colors.base0C}",
              "info.border": "#${config.lib.stylix.colors.base0D}",
              "modified": "#${config.lib.stylix.colors.base09}",
              "modified.background": "#dec1841a",
              "modified.border": "#5d4c2fff",
              "predictive": "#5a6a87ff",
              "predictive.background": "#5a6a871a",
              "predictive.border": "#38482fff",
              "renamed": "#${config.lib.stylix.colors.base0C}",
              "renamed.background": "#${config.lib.stylix.colors.base0C}",
              "renamed.border": "#${config.lib.stylix.colors.base0D}",
              "success": "#${config.lib.stylix.colors.base0A}",
              "success.background": "#a1c1811a",
              "success.border": "#38482fff",
              "unreachable": "#${config.lib.stylix.colors.base04}",
              "unreachable.background": "#8389941a",
              "unreachable.border": "#${config.lib.stylix.colors.base02}",
              "warning": "#${config.lib.stylix.colors.base09}",
              "warning.background": "#dec1841a",
              "warning.border": "#5d4c2fff",
              "players": [
                {
                  "cursor": "#${config.lib.stylix.colors.base0C}",
                  "background": "#${config.lib.stylix.colors.base0C}",
                  "selection": "#74ade83d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base08}",
                  "background": "#${config.lib.stylix.colors.base08}",
                  "selection": "#be50463d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base09}",
                  "background": "#${config.lib.stylix.colors.base09}",
                  "selection": "#bf956a3d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base0D}",
                  "background": "#${config.lib.stylix.colors.base0D}",
                  "selection": "#b477cf3d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base0B}",
                  "background": "#${config.lib.stylix.colors.base0B}",
                  "selection": "#6eb4bf3d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base08}",
                  "background": "#${config.lib.stylix.colors.base08}",
                  "selection": "#d072773d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base09}",
                  "background": "#${config.lib.stylix.colors.base09}",
                  "selection": "#dec1843d"
                },
                {
                  "cursor": "#${config.lib.stylix.colors.base0A}",
                  "background": "#${config.lib.stylix.colors.base0A}",
                  "selection": "#a1c1813d"
                }
              ],
              "syntax": {
                "attribute": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                },
                "boolean": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "comment": {
                  "color": "#5d636fff",
                  "font_style": null,
                  "font_weight": null
                },
                "comment.doc": {
                  "color": "#${config.lib.stylix.colors.base0D}",
                  "font_style": null,
                  "font_weight": null
                },
                "constant": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "constructor": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                },
                "embedded": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis.strong": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": 700
                },
                "enum": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "function": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                },
                "hint": {
                  "color": "#788ca6ff",
                  "font_style": null,
                  "font_weight": 700
                },
                "keyword": {
                  "color": "#${config.lib.stylix.colors.base0D}",
                  "font_style": null,
                  "font_weight": null
                },
                "label": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                },
                "link_text": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": "normal",
                  "font_weight": null
                },
                "link_uri": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "number": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "operator": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "predictive": {
                  "color": "#5a6a87ff",
                  "font_style": "italic",
                  "font_weight": null
                },
                "preproc": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "primary": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "property": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.bracket": {
                  "color": "#${config.lib.stylix.colors.base06}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.delimiter": {
                  "color": "#${config.lib.stylix.colors.base06}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.list_marker": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.special": {
                  "color": "#b1574bff",
                  "font_style": null,
                  "font_weight": null
                },
                "string": {
                  "color": "#${config.lib.stylix.colors.base0A}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.escape": {
                  "color": "#${config.lib.stylix.colors.base0D}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.regex": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special.symbol": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "tag": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                },
                "text.literal": {
                  "color": "#${config.lib.stylix.colors.base0A}",
                  "font_style": null,
                  "font_weight": null
                },
                "title": {
                  "color": "#${config.lib.stylix.colors.base08}",
                  "font_style": null,
                  "font_weight": 400
                },
                "type": {
                  "color": "#${config.lib.stylix.colors.base0B}",
                  "font_style": null,
                  "font_weight": null
                },
                "variable": {
                  "color": "#${config.lib.stylix.colors.base05}",
                  "font_style": null,
                  "font_weight": null
                },
                "variable.special": {
                  "color": "#${config.lib.stylix.colors.base09}",
                  "font_style": null,
                  "font_weight": null
                },
                "variant": {
                  "color": "#${config.lib.stylix.colors.base0C}",
                  "font_style": null,
                  "font_weight": null
                }
              }
            }
          },
        ]
      }
    '';
  };
}
