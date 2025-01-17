{ pkgs, settings, lib, ... }:

let
  ui_font_size = (lib.toInt settings.font-size) * 5 / 3;
  buffer_font_size = (lib.toInt settings.font-size) * 4 / 3;
in {
  imports = [ ./theme.nix ];
  home-manager.users.${settings.userName} = {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "csharp"
        "java"
        "lua"
        "zig"
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
      ];
      extraPackages = [ pkgs.nixd ];
      package = pkgs.zed-editor;
      userKeymaps = { };
      userSettings = {
        vim_mode = true;

        features = { copilot = false; };

        # Telemetry
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

        # LSP - Config
        lsp = { nix = { binary.path = lib.getExe pkgs.nixd; }; };
      };
    };
  };
}
