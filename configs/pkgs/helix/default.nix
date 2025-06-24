{
  config,
  settings,
  lib,
  pkgs,
  ...
}:
{
  qt.enable = true;

  environment.systemPackages = with pkgs; [
    # nixlang
    nixd
    nixfmt-rfc-style
  ];

  home-manager.users.${settings.userName} = {
    programs.helix = {
      enable = true;
      settings = {
        theme = "stylix";
        editor = {
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
        };
      };
      languages = {
        language = [
          {
            name = "nix";
            auto-format = true;
            language-servers = [ "nixd" ];
            formatter = {
              command = lib.getExe pkgs.nixfmt-rfc-style;
            };
          }
          {
            name = "qml";
            auto-format = true;
            language-servers = [ "qmlls" ];
          }
        ];
        language-server = {
          nixd = {
            command = "nixd";
            formatting = {
              command = [ "nixfmt" ];
            };
            nixpkgs.expr = "import (builtins.getFlake /home/matteo/.dot-nixe).inputs.nixpkgs { }";
          };
          qmlls = {
            args = [ "-E" ];
            command = "qmlls";
          };
        };
      };
    };
    home.file = {
      theme = {
        target = ".config/helix/themes/stylix.toml";
        text = ''
          "attributes" = "base09"
          "comment" = { fg = "base03", modifiers = ["italic"] }
          "constant" = "base09"
          "constant.character.escape" = "base0C"
          "constant.numeric" = "base09"
          "constructor" = "base0D"
          "debug" = "base03"
          "diagnostic" = { modifiers = ["underlined"] }
          "diff.delta" = "base09"
          "diff.minus" = "base08"
          "diff.plus" = "base0B"
          "error" = "base08"
          "function" = "base0D"
          "hint" = "base03"
          "info" = "base0D"
          "keyword" = "base0E"
          "label" = "base0E"
          "namespace" = "base0E"
          "operator" = "base05"
          "special" = "base0D"
          "string"  = "base0B"
          "type" = "base0A"
          "variable" = "base08"
          "variable.other.member" = "base0B"
          "warning" = "base09"

          "markup.bold" = { fg = "base0A", modifiers = ["bold"] }
          "markup.heading" = "base0D"
          "markup.italic" = { fg = "base0E", modifiers = ["italic"] }
          "markup.link.text" = "base08"
          "markup.link.url" = { fg = "base09", modifiers = ["underlined"] }
          "markup.list" = "base08"
          "markup.quote" = "base0C"
          "markup.raw" = "base0B"
          "markup.strikethrough" = { modifiers = ["crossed_out"] }

          "diagnostic.hint" = { underline = { style = "curl" } }
          "diagnostic.info" = { underline = { style = "curl" } }
          "diagnostic.warning" = { underline = { style = "curl" } }
          "diagnostic.error" = { underline = { style = "curl" } }

          "ui.background" = { bg = "base00" }
          "ui.bufferline.active" = { fg = "base00", bg = "base03", modifiers = ["bold"] }
          "ui.bufferline" = { fg = "base04", bg = "base00" }
          "ui.cursor" = { fg = "base0A", modifiers = ["reversed"] }
          "ui.cursor.insert" = { fg = "base0A", modifiers = ["reversed"] }
          "ui.cursorline.primary" = { fg = "base05", bg = "base01" }
          "ui.cursor.match" = { fg = "base0A", modifiers = ["reversed"] }
          "ui.cursor.select" = { fg = "base0A", modifiers = ["reversed"] }
          "ui.gutter" = { bg = "base00" }
          "ui.help" = { fg = "base06", bg = "base01" }
          "ui.linenr" = { fg = "base03", bg = "base00" }
          "ui.linenr.selected" = { fg = "base04", bg = "base01", modifiers = ["bold"] }
          "ui.menu" = { fg = "base05", bg = "base01" }
          "ui.menu.scroll" = { fg = "base03", bg = "base01" }
          "ui.menu.selected" = { fg = "base01", bg = "base04" }
          "ui.popup" = { bg = "base01" }
          "ui.selection" = { bg = "base02" }
          "ui.selection.primary" = { bg = "base02" }
          "ui.statusline" = { fg = "base04", bg = "base01" }
          "ui.statusline.inactive" = { bg = "base01", fg = "base03" }
          "ui.statusline.insert" = { fg = "base00", bg = "base0B" }
          "ui.statusline.normal" = { fg = "base00", bg = "base03" }
          "ui.statusline.select" = { fg = "base00", bg = "base0F" }
          "ui.text" = "base05"
          "ui.text.focus" = "base05"
          "ui.virtual.indent-guide" = { fg = "base03" }
          "ui.virtual.inlay-hint" = { fg = "base03" }
          "ui.virtual.ruler" = { bg = "base01" }
          "ui.virtual.jump-label" = { fg = "base0A", modifiers = ["bold"] }
          "ui.window" = { bg = "base01" }

          [palette]
          base00 = "#${config.lib.stylix.colors.base00}"
          base01 = "#${config.lib.stylix.colors.base01}"
          base02 = "#${config.lib.stylix.colors.base02}"
          base03 = "#${config.lib.stylix.colors.base03}"
          base04 = "#${config.lib.stylix.colors.base04}"
          base05 = "#${config.lib.stylix.colors.base05}"
          base06 = "#${config.lib.stylix.colors.base06}"
          base07 = "#${config.lib.stylix.colors.base07}"
          base08 = "#${config.lib.stylix.colors.base08}"
          base09 = "#${config.lib.stylix.colors.base09}"
          base0A = "#${config.lib.stylix.colors.base0A}"
          base0B = "#${config.lib.stylix.colors.base0B}"
          base0C = "#${config.lib.stylix.colors.base0C}"
          base0D = "#${config.lib.stylix.colors.base0D}"
          base0E = "#${config.lib.stylix.colors.base0E}"
          base0F = "#${config.lib.stylix.colors.base0F}"
        '';
      };
    };
  };
}
