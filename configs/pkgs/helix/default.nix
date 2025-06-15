{
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
  };
}
