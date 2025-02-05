{ lib, pkgs, settings, ... }:
let
  ui_font_size = (lib.toInt settings.font-size) * 5 / 3;
  buffer_font_size = (lib.toInt settings.font-size) * 4 / 3;
in {
  home-manager.users.${settings.userName} = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "csharp"
        "basher"
        "powershell"
        "java"
        "lua"
        "zig"
        "dockerfile"
        "docker-compose"
        "svelte"
        "scss"
        "log"
        "elixir"
        "env"
        "latex"
        "ini"
        "make"
        "xml"
        "qml"
        "git_firefly"
      ];
      extraPackages = with pkgs; [
        nixd
        nixfmt-classic
        nil
        kdePackages.qtdeclarative
        shellcheck
        shfmt
      ];

      package = pkgs.zed-editor;
      userKeymaps = { };
      userSettings = {

        # Important Stuff
        vim_mode = true;
        features.copilot = false;

        # Telemetry Data Collection
        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        # Font
        inherit ui_font_size; # pt -> px
        inherit buffer_font_size; # ^
        buffer_font_family = "Hack Nerd Font";

        # Theme
        theme = {
          mode = "dark";
          light = "Base16 Stylix";
          dark = "Base16 Stylix";
        };

        # Language Configuration
        languages = {
          Nix = {
            formatter.command = "nixfmt";
            language_servers = [ "nixd" "!nil" ];
          };
        };

        # LSP - Config
        lsp = {
          nixd.settings.diagnostic.suppress = [ "sema-extra-with" ];
          nil.settings.formatting.command = [ "nixfmt" ];
        };
      };
    };
  };
}
