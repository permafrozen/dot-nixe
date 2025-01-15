{ pkgs, settings, ... }:

{
  imports = [ ./theme.nix ];
  home-manager.users.${settings.userName} = {
    programs.zed-editor = {
      enable = true;
      extensions = [ ];
      extraPackages = [ ];
      package = pkgs.zed-editor;
      userKeymaps = { };
      userSettings = {
        theme = {
          mode = "light";
          light = "Stylix";
          dark = "Stylix";
        };
        vim_mode = true;
      };
    };
  };
}
