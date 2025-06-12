{
  settings,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    helix
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
        ];
        language-server = {
          nixd = {
            command = "nixd";
            formatting = {
              command = [ "nixfmt" ];
            };
            nixpkgs.expr = "import (builtins.getFlake /home/matteo/.dot-nixe/).inputs.nixpkgs { }";
            home-manager.expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.matteo.options.home-manager.users.type.getSubOptions []";
          };
        };
      };
    };
  };
}
