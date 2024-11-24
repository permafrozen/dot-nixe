{ settings, ... }:

{
  nix.settings = {
    substituters = [ "https://walker.cachix.org" ];
    trusted-public-keys =
      [ "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM=" ];
  };

  home-manager.users.${settings.userName} = {
    programs.walker = {
      enable = true;
      runAsService = true;

      # All options from the config.json can be used here.
      config = {
        search.placeholder = "Example";
        ui.fullscreen = true;
        list = { height = 200; };
        websearch.prefix = "?";
        switcher.prefix = "/";
      };

      # If this is not set the default styling is used.
      # style = ''
      #   * {
      #     color: #dcd7ba;
      #   }
      # '';
    };
  };
}
