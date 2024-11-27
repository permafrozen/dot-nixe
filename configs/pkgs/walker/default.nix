{ config, settings, ... }:

{

  nix.settings = {
    substituters =
      [ "https://walker-git.cachix.org" "https://walker.cachix.org" ];
    trusted-public-keys = [
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
    ];
  };

  home-manager.users.${settings.userName} = {
    programs.walker = {
      enable = true;
      runAsService = true;

      # All options from the config.json can be used here.
      config = {
        search.placeholder = "Search";
        ui.fullscreen = true;
        list = { height = 200; };
        websearch.prefix = "?";
        switcher.prefix = "/";
        theme = "home-manager";
      };

      theme = {
        style = ''
          * {
            color: #${config.lib.stylix.colors.base05};
            background-color: #${config.lib.stylix.colors.base00};
          }
        '';
      };
    };
  };
}
