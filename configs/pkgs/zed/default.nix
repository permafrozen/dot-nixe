{ pkgs, settings, lib, ... }:

let
  ui_font_size = (lib.toInt settings.font-size) * 5 / 3;
  buffer_font_size = (lib.toInt settings.font-size) * 4 / 3;
in {
  imports = [ ./theme.nix ];
  home-manager.users.${settings.userName} = {
    programs.zed-editor = {
      enable = true;
      extensions = [ ];
      extraPackages = [ ];
      package = pkgs.zed-editor;
      userKeymaps = { };
      userSettings = {
        vim_mode = true;

        # Font
        inherit ui_font_size;     # pt -> px
        inherit buffer_font_size; # ^
        buffer_font_family = "Hack Nerd Font";

        # Theme
        theme = {
          mode = "light";
          light = "Stylix";
          dark = "Stylix";
        };
      };
    };
  };
}
