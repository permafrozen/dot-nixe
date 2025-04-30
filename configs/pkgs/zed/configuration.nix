{ config, lib, pkgs, settings, ... }:
let
  # conversion from pt
  ui_font_size = (lib.toInt settings.font-size) * 5 / 3;
  buffer_font_size = (lib.toInt settings.font-size) * 4 / 3;
in {

  environment.systemPackages = with pkgs; [
    nixd
    dotnetCorePackages.sdk_8_0
    dotnetCorePackages.runtime_8_0
  ];

  # C# env vars
  environment.sessionVariables = {
    DOTNET_BIN = "${pkgs.dotnetCorePackages.sdk_8_0}/bin/dotnet";
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.runtime_8_0}/share/dotnet/";
  };

  home-manager.users.${settings.userName} = {
    programs.zed-editor = {
      package = pkgs.zed-editor-fhs; # <- FHS environment for LSPs
      enable = true;
      extensions = [
        "csharp"
        "basher"
        "powershell"
        "php"
        "java"
        "lua"
        "zig"
        "toml"
        "nix"
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
        "git-firefly"
      ];
      extraPackages = with pkgs; [
        dotnet-runtime_8
        rust-analyzer
        nixd
        nixfmt-classic
        nil
        kdePackages.qtdeclarative
        shellcheck
        shfmt
        php
      ];

      userKeymaps = { };
      userSettings = {

        # Important Stuff
        vim_mode = true;
        relative_line_numbers = true;
        features.copilot = false;
        dock = "right";

        # Ui
        project_panel = {
          button = true;
          default_width = 240;
          dock = "right";
          entry_spacing = "comfortable";
        };

        assistant = {
          enabled = false;
          button = false;
          dock = "right";
        };

        outline_panel = {
          button = false;
          default_width = 300;
          dock = "right";
        };

        # Telemetry Data Collection
        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        # Font
        inherit ui_font_size; # pt -> px
        inherit buffer_font_size; # ^
        ui_font_family = "${config.stylix.fonts.monospace.name}";
        buffer_font_family = "${config.stylix.fonts.monospace.name}";

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
            language_servers = [ "nixd" "nil" "..." ];
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
