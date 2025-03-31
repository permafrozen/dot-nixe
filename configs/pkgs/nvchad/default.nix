{ pkgs, inputs, settings, ... }: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };

  home-manager.users.${settings.userName} = {
    imports = [ inputs.nvchad4nix.homeManagerModule ];
    programs.nvchad = {
      enable = true;
      # *IMPORTANT*
      # This file needs to have same structure as nvconfig.lua
      # https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

      extraPlugins = ''
      return {
        {"NvChad/base46",lazy=false},
      }
      '';

      chadrcConfig = ''
        ---@type ChadrcConfig
        local M = {

            base46 = {
                theme = "onedark",
                transparency = true,
            },

            nvdash = {
                load_on_startup = true,
                header = {
                "                                      ",
                "          ▄▄         ▄ ▄▄▄▄▄▄▄        ",
                "        ▄▀███▄     ▄██ █████▀         ",
                "        ██▄▀███▄   ███                ",
                "        ███  ▀███▄ ███                ",
                "        ███    ▀██ ███                ",
                "        ███      ▀ ███                ",
                "        ▀██ █████▄▀█▀▄██████▄         ",
                "          ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀        ",
                "                                      ",
                "     Powered By Evil Jonkler Gmbh    ",
                "                                      ",
                },
            },
        }

        return M
      '';
    };
  };
}
